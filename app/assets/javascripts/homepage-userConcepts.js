$(function () {
  $('a#show-user-concepts').on('click', function (event) {
    event.preventDefault();
    
    $.getJSON(this.href, function (userData) {
      userData.concepts.sort((a, b) => {
        let titleA = a.title.toUpperCase();
        let titleB = b.title.toUpperCase();
        if (titleA < titleB) {
          return -1;
        }
        if (titleA > titleB) {
          return 1;
        }
        return 0;
      });
      debugger
    });
  });
});