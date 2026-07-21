const searchBox = document.getElementById("publication-search");
const typeSelect = document.getElementById("publication-type");

let selectedTag = "all";

const cards = document.querySelectorAll(".publication-card");

const tagButtons =
    document.querySelectorAll(".publication-tag");

function filterPublications() {

    const search =
        searchBox.value.toLowerCase().trim();

    const type =
        typeSelect.value;

    cards.forEach(card => {

        const title =
            card.dataset.title;

        const authors =
            card.dataset.authors;

        const venue =
            (card.dataset.venue || "").toLowerCase();

        const publicationType =
            card.dataset.type;

        const tags =
            card.dataset.tags;

        const matchesSearch =
            title.includes(search) ||
            authors.includes(search) ||
            venue.includes(search);

        const matchesType =
            type === "all" ||
            publicationType === type;

        const matchesTag =
            selectedTag === "all" ||
            tags.includes(selectedTag);

        card.style.display =
            matchesSearch &&
            matchesType &&
            matchesTag
            ? ""
            : "none";

    });

}


searchBox.addEventListener(
    "input",
    filterPublications
);

typeSelect.addEventListener(
    "change",
    filterPublications
);

tagButtons.forEach(button => {

    button.addEventListener("click", () => {

        tagButtons.forEach(btn =>
            btn.classList.remove("active"));

        button.classList.add("active");

        selectedTag =
            button.dataset.tag;

        filterPublications();

    });

});

filterPublications();