class Concept {
  constructor(id, title, description, user_id, favorited) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.user_id = user_id;
    this.favorited = favorited;
  }
}

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
          
          let url = `/users/${currentConcept.user_id}/concepts/${currentConcept.id}`;
          // debugger
          $notFavs.append(`<a href="${url}"> ${currentConcept.title} </a> <br>`)
        });
      } else {
        console.log("Hello!")
      }
    })
  });
});