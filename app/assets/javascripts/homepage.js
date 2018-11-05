$(function() {   //Once document is ready ie page is loaded...
  $('a.nextConcept').on('click', function(e) {   //Hijack click event
    e.preventDefault();    //prevent browser from executing default action
    $.getJSON(this.href, function(json) {        //HTTP GET request for some JSON. Upon success do...
      let $conceptTitle = $('h4.concept-title'); //Capture concept title
      let $conceptUser = $('h5.concept-user');   //Capture concepts user
      let $cardDesc = $('p.concept-desc');       //Capture concept description
      
      $conceptTitle.html(json.title)    //Replace concept title
      $conceptUser.html(json.user);     //Replace concept user
      $cardDesc.html(json.description); //Replace concept description
    });
  });
});
 