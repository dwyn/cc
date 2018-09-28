// class Concept {
//   constructor(id, title, description, user_id, section_id, favorited) {
//     this.id = id;
//     this.title = title;
//     this.description = description;
//     this.user_id = user_id;
//     this.section_id = section_id;
//     this.favorited = favorited;
//   }
// }

// $(function() { //Once document is ready ie page is loaded...
//   $.get(`${window.location.href}.json`, function(data) { // HTTP GET request for some JSON. Upon success do...
//     $('.result').html(data);
//     {
//       let $userConcepts = $('.userConcepts');
//       data.forEach(concept => {
//         current_concept = new Concept(
//           concept.id,
//           concept.title,
//           concept.description,
//           concept.user_id,
//           concept.section_id,
//           concept.favorited
//         );

//         let concept_link = $('<a></a> <br>');
//         let url = `users/${current_concept.user_id}/concepts/${current_concept.id}`;
//         concept_link.attr('href', url);
//         concept_link.html(current_concept.title);
//         $userConcepts.append(concept_link);
//       });
//     }
//   });
// });


// // $(function () {   //Once document is ready ie page is loaded...
// //   $('a.nextConcept').on('click', function (e) {   //Hijack click event
// //     e.preventDefault();    //prevent browser from executing default action
// //     $.get(this.href, function (json) {   // HTTP GET request for some JSON. Upon success do...
// //       var $cardTitle = $('h2.card-title');   //Capture concept title
// //       var $cardDescription = $('p.card-text');   //Capture concept description

// //       $cardTitle.html(json.title);   //Replace concept title
// //       $cardDescription.html(json.description);   //Replace concept description
// //     });
// //   });
// // });
