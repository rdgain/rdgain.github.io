document.addEventListener("DOMContentLoaded", function () {
    const cards = Array.from(document.querySelectorAll(".project-card"));
    const searchInput = document.getElementById("project-search");
    const skillSelect = document.getElementById("project-skill");
    const typeSelect = document.getElementById("project-type");
    const evidenceSelect = document.getElementById("project-evidence");
    const resetButton = document.getElementById("project-filter-reset");
    const countStatus = document.getElementById("project-filter-count");
    const noResults = document.getElementById("project-no-results");

    if (!cards.length || !searchInput || !skillSelect || !typeSelect || !evidenceSelect ||
        !resetButton || !countStatus || !noResults) {
        return;
    }

    const sections = Array.from(document.querySelectorAll("[data-project-section]"));
    const total = cards.length;

    function filterProjects() {
        const query = searchInput.value.trim().toLocaleLowerCase();
        const selectedSkill = skillSelect.value;
        const selectedType = typeSelect.value;
        const selectedEvidence = evidenceSelect.value;
        let visibleCount = 0;

        cards.forEach(function (card) {
            const searchContent = (card.dataset.projectSearch + " " + card.textContent).toLocaleLowerCase();
            const skills = (card.dataset.projectSkills || "").split("|");
            const evidence = (card.dataset.projectEvidence || "").split("|");
            const matchesSearch = !query || searchContent.includes(query);
            const matchesSkill = selectedSkill === "all" || skills.includes(selectedSkill);
            const matchesType = selectedType === "all" || card.dataset.projectCategory === selectedType;
            const matchesEvidence = selectedEvidence === "all" || evidence.includes(selectedEvidence);
            const visible = matchesSearch && matchesSkill && matchesType && matchesEvidence;

            card.hidden = !visible;
            if (visible) visibleCount += 1;
        });

        sections.forEach(function (section) {
            section.hidden = !section.querySelector(".project-card:not([hidden])");
        });

        countStatus.textContent = "Showing " + visibleCount + " of " + total +
            (total === 1 ? " project." : " projects.");
        noResults.hidden = visibleCount !== 0;
    }

    searchInput.addEventListener("input", filterProjects);
    [skillSelect, typeSelect, evidenceSelect].forEach(function (select) {
        select.addEventListener("change", filterProjects);
    });

    resetButton.addEventListener("click", function () {
        searchInput.value = "";
        skillSelect.value = "all";
        typeSelect.value = "all";
        evidenceSelect.value = "all";
        filterProjects();
    });

    filterProjects();
});
