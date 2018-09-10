$(function () {   //Once document is ready ie page is loaded...
  $.get("/user_concepts.json", function (data) {   // HTTP GET request for some JSON. Upon success do...
    $(".result").html(data);
    alert("Load was performed.");
    
  });
});


// var $cardTitle = $('h2.card-title');   //Capture concept title
// var $cardDescription = $('p.card-text');   //Capture concept description

// $cardTitle.html(json.title);   //Replace concept title
// $cardDescription.html(json.description);   //Replace concept description