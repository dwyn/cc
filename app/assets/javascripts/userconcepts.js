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

$(function() {
  //Once document is ready ie page is loaded...
  $.get(`${window.location.href}.json`, function(data) {
    // HTTP GET request for some JSON. Upon success do...
    $('.result').html(data);
    {
      data.forEach(concept => {
        current_concept = new Concept(
          concept.id,
          concept.title,
          concept.description,
          concept.user_id,
          concept.section_id,
          concept.favorited
        );
        let concept_div = $('<div></div>');
        concept_div.addClass('userConcept');
        
        let concept_link = $('<a></a>');
        let url = `users/${current_concept.user_id}/concepts/${current_concept.id}`;
        debugger
        concept_link.attr('href', url);
        concept_link.html(current_concept.title);
        concept_div.append(concept_link);
        $('.userConcepts').append(concept_div);
      });
    }
  });
});


