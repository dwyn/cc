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

// function Concept(attrs) {
//   // the body here is the same as the body of your eS6 Concept class' constructor method
// }

// Concept.prototype.conceptLink = function() {
//   // the same as the conceptLink prototype method above
// }

$(function() { //Once document is ready ie page is loaded...
  $('a.remainingConcepts').on('click', function (e) {   //Hijack click event
    e.preventDefault();    //prevent browser from executing default action
    $.getJSON(this.href, function (json) {   // HTTP GET request for some JSON. Upon success do...
      let $notFavs = $('#notFavs');

      if ($notFavs.val() === "") {
        json.forEach(concept => {
            let currentConcept = new Concept(
            concept.id,
            concept.title,
            concept.description,
            concept.user_id,
            concept.favorited

          );
          
          $notFavs.append(currentConcept.conceptLink())
        });
      } else {
        console.log("Hello!")
      }
    })
  });
});