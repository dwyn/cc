$(function() {
  $("#show-user-concepts").on('click', function (e) {
    e.preventDefault();
    $('#user-concepts-show-table').toggle(200)
  });

  $("#show-user-concepts").one('click', function (e) {
    e.preventDefault();
    $.getJSON(this.href, function (userData) {
      $userConcepts = $('#user-concepts-show-table')
      sortedConcepts = userData.concepts.sort((a, b) => {
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

      sortedConcepts.forEach((concept) => {
        let userConcept = new Concept(
          concept.id,
          concept.title,
          concept.description,
          concept.user_id,
          concept.favorited
        )
        $userConcepts.append(userConcept.conceptLink())
      });
    })
  })
});