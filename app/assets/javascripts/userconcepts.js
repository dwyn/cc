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