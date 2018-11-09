$(function () {
  $('#testing-bruh').on('click', function (e) {
    e.preventDefault();
    url = "http://localhost:3000/users/1"

    $.getJSON(url, function (json) {
      let newUser = new User(json)

      newUser.userConceptsList()
    })
  });
});