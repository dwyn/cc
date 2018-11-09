class Concept {
  constructor(id, title, description, user_id, favorited) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.user_id = user_id;
    this.favorited = favorited;
    this.url = `/users/${this.user_id}/concepts/${this.id}`;
  }
  conceptLink() {
    return `<a href="${this.url}"> ${this.title} </a> <br>`
  }
}


// Concept.prototype.conceptLink = function() {
//   // the same as the conceptLink prototype method above
// }