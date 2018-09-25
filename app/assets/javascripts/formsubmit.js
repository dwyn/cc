// document.addEventListener("DOMContentLoaded", function () {
//   // Handler when the DOM is fully loaded
// });

$(function(){
  $(".new_concept").on("submit", function(e) { // 1. Handle submit event
    e.preventDefault();
    url = this.action

    params = { // 2. Structure parameters to be sent in the request 
      concept: {
        title: document.querySelector("#concept_title").value
      }
      // authenticity_token: document.querySelector("input[name=authenticity_token]")
    }

    debugger
    fetch(url, { // 3. Submit post request
      method: "POST",
      credentials: "same-origin",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(params)
    })
    // 4. How to handle response (check fetch documentation first) 
    .then(response => response.json()); // parses response to JSON
  })
});


