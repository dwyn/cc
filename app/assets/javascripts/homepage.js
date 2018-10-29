$(function() {   //Once document is ready ie page is loaded...
  $('a.nextConcept').on('click', function(e) {   //Hijack click event
    e.preventDefault();    //prevent browser from executing default action
    $.getJSON(this.href, function(json) {        //HTTP GET request for some JSON. Upon success do...
      var $conceptTitle = $('h4.concept-title'); //Capture concept title
      var $conceptUser = $('h5.concept-user');   //Capture concepts user
      var $cardDesc = $('p.concept-desc');       //Capture concept description
      // console.log(json.data)
      // debugger
      $conceptTitle.html(json.data.attributes.title)  //Replace concept title
      $conceptUser.html(json.data.attributes.user);     //Replace concept user
      $cardDesc.html(json.data.attributes.description); //Replace concept description
    });
  });
});
