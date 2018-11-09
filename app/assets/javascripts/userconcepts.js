$(function() {
  $('a.remainingConcepts').on('click', function (e) {
    e.preventDefault();
    $.getJSON(this.href, function (json) {
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