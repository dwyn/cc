// // document.addEventListener("DOMContentLoaded", function () {
// //   // Handler when the DOM is fully loaded
// // });

// $(document).ready(function () {
//   $("#new_concept").on("submit", function(e) { // 1. Handle submit event
//     e.preventDefault();
//     url = this.action
//     params = { // 2. Structure parameters to be sent in the request 
//       concept: {
//         title: document.querySelector("#concept_title").value,
//         description: document.querySelector("#concept_description").value
//       }
//     }

//     fetch(url, { // 3. Submit post request
//       method: "POST",
//       credentials: "same-origin",
//       headers: { 
//         'Accept': 'application/json',
//         'Content-Type': 'application/json'
//       },
//       body: JSON.stringify(params)
//     })// 4. How to handle response (check fetch documentation first) 
//     .then(response => response.json()) // parses response to JSON
//     // .then(res => res.text())          // convert to plain text
//     // .then(text => console.log(text))  // then log it out
//     // .then(json => console.log(json));
//   });
// });