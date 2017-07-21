//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

//= require_tree .

//= require underscore
//= require gmaps/google
//= require bootstrap-material-design

//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-material-design
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
    $('.link-sidebar').removeClass('active')
    $(this).addClass('active');
  });

  $.material.init();
});

