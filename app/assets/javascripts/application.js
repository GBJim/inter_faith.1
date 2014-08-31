// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require posts
//= require_tree .
//= require ckeditor-jquery
//= require masonry/jquery.masonry
//= require jquery.leanModal.min


$(function() {
  return $('#masonry-container').imagesLoaded(function() {
    return $('#masonry-container').masonry({
      itemSelector: '.box',
      isFitWidth: true
    });
  });
});

var modal;
modal = function() {
  return $("#modal_trigger").leanModal({
    top: 200,
    overlay: 0.6,
    closeButton: ".modal_close"
  });

};



var clickRegistration;
clickRegistration = (function () {
    // Calling Login Form
    $("#sign-up_trigger").click(function () {
        $(".user_login").hide();
        $(".user_register").show();
        return false;
    });
      $(".login-window").click(function () {
        $(".user_login").show();
        $(".user_register").hide();
        return false;
    });


   

  })

$(document).ready(modal);
$(document).ready(clickRegistration);