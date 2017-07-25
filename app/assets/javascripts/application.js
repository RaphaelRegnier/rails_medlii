//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require bootstrap-material-design
//= require bootstrap-datepicker

//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-material-design
//= require nouislider
//= require_tree .

$(document).ready(function() {
  $('.attachinary-input').attachinary();
  $('.sidebar-btn').click(function(){
    $('.sidebar').toggleClass('sidebar-visible');
    $('#toggle_for_sidebar').toggleClass('dark-filter');
  });
  $('#cross-sidebar').click(function(){
    $('.sidebar').toggleClass('sidebar-visible');
    $('#toggle_for_sidebar').toggleClass('dark-filter');
  });
  $('.link-sidebar').click(function(){
    $('.link-sidebar').removeClass('active');
    $(this).addClass('active');
  });
  $('#link-message').click(function(){
    $(this).toggleClass('shadow');
    });
//   if (window.location.pathname.includes('/users')) {
//   $('#search').addClass('active');
// }

  $.material.init();

  $('.datepicker').datepicker();

  setTimeout(function() {
    $('.alert').slideUp()
  }, 3000)

  if ($(".alert").text().trim() == "") {
    $(".alert").addClass("hide")
  };
});



