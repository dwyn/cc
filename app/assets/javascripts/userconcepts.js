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
      let $remainingConcepts = $('#remainingConcepts');

      json.forEach(concept => {
        current_concept = new Concept(
        concept.id,
        concept.title,
        concept.description,
        concept.user_id,
        concept.favorited
      );

      let concept_link = $('<a></a> <br>'); // Empty anchor tag
      let horizontal_line = "<hr> <br>"  // Horizontal line to append to div
      concept_link.html(current_concept.title); // Set anchor tags title

      let url = `users/${current_concept.user_id}/concepts/${current_concept.id}`;
      debugger
      concept_link.attr('href', url);

      $remainingConcepts.append(concept_link);
      $remainingConcepts.append(`${current_concept.description} <br>`);
      $remainingConcepts.append(`${current_concept.favorited} <br>`);
      $remainingConcepts.append(horizontal_line);
      });
    })
  });
});





// //     $.get(this.href, function (json) {   // HTTP GET request for some JSON. Upon success do...
// //       var $cardTitle = $('h2.card-title');   //Capture concept title
// //       var $cardDescription = $('p.card-text');   //Capture concept description

// //       $cardTitle.html(json.title);   //Replace concept title
// //       $cardDescription.html(json.description);   //Replace concept description
// //     });
// //   });
// // });
