$(function() {   //Once document is ready ie page is loaded...
  $('a.nextConcept').on('click', function(e) {   //Hijack click event
    e.preventDefault();    //prevent browser from executing default action
    
    var url = $(this).attr("action");
    $.getJSON(url, function(json) {   // HTTP GET request for some JSON. Upon success do...
      var $cardTitle = $('h2.card-title');   //Capture concept title
      var $cardDescription = $('p.card-text');   //Capture concept description

      $cardTitle.html(json.title);   //Replace concept title
      $cardDescription.html(json.description);   //Replace concept description
    });
  });
});
