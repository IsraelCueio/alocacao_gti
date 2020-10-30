$(document).on('ready turbolinks:load', function() {
  console.log("turbolinks")
  $('.navbar-burger').on('click', function() {
    $('.navbar-menu').toggleClass('is-active', 'addOrRemove' )
  });
})
