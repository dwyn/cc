class Concept {
  constructor(id, title, description, user_id, section_id, favorited) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.user_id = user_id;
    this.section_id = section_id;
    this.favorited = favorited;
  }
}

$(function() { //Once document is ready ie page is loaded...
  $.get(`${window.location.href}.json`, function(data) { // HTTP GET request for some JSON. Upon success do...
    $('.result').html(data);
    {
      let $userConcepts = $('.userConcepts');
      data.forEach(concept => {
        current_concept = new Concept(
          concept.id,
          concept.title,
          concept.description,
          concept.user_id,
          concept.section_id,
          concept.favorited
        );

        let concept_link = $('<a></a> <br>');
        let url = `users/${concept.user_id}/concepts/${current_concept.id}`;

        concept_link.attr('href', url);
        concept_link.html(current_concept.title);
        $userConcepts.append(concept_link);
      });
    }
  });
});
