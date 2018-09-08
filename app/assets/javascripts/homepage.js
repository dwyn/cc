$(function () { //Once document is ready ie page is loaded...
  $("a.next_concept").on("click", function(e)){ //Hijack click event

    e.preventDefault(); //prevent browser from executing default action 
  })
})