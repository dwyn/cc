class User {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.display_name = attributes.display_name;
    this.email = attributes.email;
    this.concepts = attributes.concepts
    this.url = `/users/${this.id}`;
  }
  userShowPath() {
    return `<a href="${this.url}"> ${this.name} </a> <br>`
  }

  userConceptsList() {
    this.concepts.sort((a, b) => {
      let titleA = a.title.toUpperCase();
      let titleB = b.title.toUpperCase();
      if (titleA < titleB) {
        return -1;
      }
      if (titleA > titleB) {
        return 1;
      }
      return 0;
    });

    this.concepts.forEach((concept) => {
      $('#testing-bruh').append(`<a href="/users/${concept.user_id}/concepts/${concept.id}"> ${concept.title} </a> <br>`)
    })
  }
}