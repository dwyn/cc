function User(attributes) {
  this.id = id;
  this.name = name;
  this.display_name = display_name;
  this.url = `/users/${this.id}`;
  
  userShowPath() {
    return `<a href="${this.url}"> ${this.title} </a> <br>`
  }
}