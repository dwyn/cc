$(document).ready(function () {
  $("#append_new_concept").on("submit", function(e) {
    e.preventDefault();
    url = this.action
    params = { 
      concept: {
        title: document.querySelector("#concept_title").value,
        description: document.querySelector("#concept_description").value,
        favorited: document.querySelector("#concept_favorited").value,
      },
      authenticity_token: document.querySelector("[name=authenticity_token]").value
    }

    fetch(url, {
      method: "POST",
      credentials: "same-origin",
      headers: { 
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(params)
    })
    .then(response => response.json())
    .then(someData => {
      let $favs = $('#favs');
      let $notFavs = $('#notFavs')
      let url = `/users/${someData.user_id}/concepts/${someData.id}`;
        debugger
      if (someData.favorited === true) {
        $favs.append(`<a href="${url}"> ${someData.title} </a> <br>`);
      } else {
        $notFavs.append(`<a href="${url}"> ${someData.title} </a> <br>`);
      }
    })
    .catch(error => console.error(`Error: ${error}`))
  });
});
