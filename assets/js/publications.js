// assets/js/publications.js

document.addEventListener("DOMContentLoaded", function () {

    const cards = Array.from(document.querySelectorAll(".publication-card"));

    const searchInput = document.getElementById("publication-search");
    const typeSelect = document.getElementById("publication-type");
    const projectSelect = document.getElementById("publication-project");
    const tagContainer = document.getElementById("publication-tags");
    const noResults = document.getElementById("publication-no-results");

    if (!searchInput || !typeSelect || !projectSelect || !tagContainer) return;

    let selectedTag = "all";

    const requestedProject = new URLSearchParams(window.location.search).get("project");
    if (requestedProject && Array.from(projectSelect.options).some(option => option.value === requestedProject)) {
        projectSelect.value = requestedProject;
    }

    //----------------------------------------------------
    // Build tag buttons automatically
    //----------------------------------------------------

    const tagSet = new Set();

    cards.forEach(card => {

        const tags = card.dataset.tags || "";

        tags.split("|").forEach(tag => {

            tag = tag.trim();

            if (tag.length > 0) {
                tagSet.add(tag);
            }

        });

    });

    function createTagButton(name, value) {

        const button = document.createElement("button");

        button.className = "publication-tag";
        button.type = "button";
        button.setAttribute("aria-pressed", value === "all" ? "true" : "false");

        if (value === "all")
            button.classList.add("active");

        button.dataset.tag = value;
        button.textContent = name;

        button.addEventListener("click", function () {

            tagContainer.querySelectorAll(".publication-tag").forEach(tagButton => {
                tagButton.classList.remove("active");
                tagButton.setAttribute("aria-pressed", "false");
            });

            button.classList.add("active");
            button.setAttribute("aria-pressed", "true");

            selectedTag = value;

            filterCards();

        });

        tagContainer.appendChild(button);

    }

    createTagButton("All", "all");

    Array.from(tagSet)
        .sort()
        .forEach(tag => createTagButton(tag, tag));

    //----------------------------------------------------
    // Filtering
    //----------------------------------------------------

    function filterCards() {

        const search =
            searchInput.value.toLowerCase().trim();

        const type =
            typeSelect.value;

        const project =
            projectSelect.value;

        let visible = 0;

        cards.forEach(card => {

            const title =
                (card.dataset.title || "").toLowerCase();

            const authors =
                (card.dataset.authors || "").toLowerCase();

            const venue =
                (card.dataset.venue || "").toLowerCase();

            const publicationType =
                card.dataset.type || "";

            const tags =
                (card.dataset.tags || "")
                    .split("|")
                    .map(t => t.trim());

            const projects =
                (card.dataset.projects || "")
                    .split("|")
                    .filter(Boolean);

            const tagString = tags.join(" ").toLowerCase();

			const matchesSearch =
				search === "" ||
				title.includes(search) ||
				authors.includes(search) ||
				venue.includes(search) ||
				tagString.includes(search);

            const matchesType =
                type === "all" ||
                publicationType === type;

            const matchesTag =
                selectedTag === "all" ||
                tags.includes(selectedTag);

            const matchesProject =
                project === "all" ||
                projects.includes(project);

            const show =
                matchesSearch &&
                matchesType &&
                matchesTag &&
                matchesProject;

            card.style.display = show ? "" : "none";

            if (show)
                visible++;

        });

        updateCounter(visible);
        if (noResults) {
            noResults.hidden = visible !== 0;
            if (visible === 0) {
                noResults.textContent =
                    project !== "all" && search === "" && type === "all" && selectedTag === "all"
                        ? "No publications are currently linked to " + projectSelect.options[projectSelect.selectedIndex].text + "."
                        : "No publications match the current search and filters.";
            }
        }

    }

    //----------------------------------------------------
    // Counter
    //----------------------------------------------------

    function updateCounter(count) {

        let counter = document.getElementById("publication-counter");

        if (!counter) {

            counter = document.createElement("div");

            counter.id = "publication-counter";

            counter.className = "publication-counter";
            counter.setAttribute("role", "status");
            counter.setAttribute("aria-live", "polite");
            counter.setAttribute("aria-atomic", "true");

            const list =
                document.querySelector(".publication-list");

            list.parentNode.insertBefore(counter, list);

        }

        if (count === 1)
            counter.textContent = "Showing 1 publication";
        else
            counter.textContent = "Showing " + count + " publications";

    }

    //----------------------------------------------------
    // Events
    //----------------------------------------------------

    searchInput.addEventListener("input", filterCards);

    typeSelect.addEventListener("change", filterCards);

    projectSelect.addEventListener("input", filterCards);

    //----------------------------------------------------
    // Initial filter
    //----------------------------------------------------

    filterCards();

});
