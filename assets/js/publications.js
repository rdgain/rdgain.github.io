// assets/js/publications.js

document.addEventListener("DOMContentLoaded", function () {

    const cards = Array.from(document.querySelectorAll(".publication-card"));

    const searchInput = document.getElementById("publication-search");
    const typeSelect = document.getElementById("publication-type");
    const tagContainer = document.getElementById("publication-tags");

    let selectedTag = "all";

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

        if (value === "all")
            button.classList.add("active");

        button.dataset.tag = value;
        button.textContent = name;

        button.addEventListener("click", function () {

            document.querySelectorAll(".publication-tag")
                .forEach(b => b.classList.remove("active"));

            button.classList.add("active");

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

            const show =
                matchesSearch &&
                matchesType &&
                matchesTag;

            card.style.display = show ? "" : "none";

            if (show)
                visible++;

        });

        updateCounter(visible);

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

    //----------------------------------------------------
    // Initial filter
    //----------------------------------------------------

    filterCards();

});