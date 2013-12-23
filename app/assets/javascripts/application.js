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
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-markdown
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  //$('.story-component').click(function(evt) {
  $('body').on('click', '.story-component', function(evt) {

    // Variables
    var scid = $(this).data('scid');
    var sid = $(this).data('sid');
    var jContent = $('.content');

    // The menu for individual story components
    $('.dropdown-menu').slideDown(200,function(){$(this).focus();});
    $('.dropdown-menu').css( {position:'absolute', top:evt.pageY, left: evt.pageX});
    
    // Link to the edit story component view
    $('#edit').click(function(evt) {
      evt.preventDefault();
      $.ajax({
        url: '/stories/' + sid + '/story_components/' + scid + '/edit',
        type: 'get',
        dataType: 'html',
        success: function( pgData ){
              jContent.html( pgData );
            }
      });
    });

    // Link to the new story component view
    $('#add').click(function(evt) {
      evt.preventDefault();
      $.ajax({
        url: '/stories/' + sid + '/story_components/new',
        type: 'get',
        dataType: 'html',
        success: function( pgData ){
              jContent.html( pgData );
            }
      });
    });
  });

  // Stories index menu and the code for loading this content dynamically
  $('body').on('click', '.story-link', function(evt) {
    evt.preventDefault();
    $('.list-group-item').removeClass('active');
    $(this).addClass('active');
    $('.selected-story').load('/stories/' + $(this).attr('data-id'));
  });
  $('.dropdown-menu').on('blur',function(){
    $(this).slideUp(200);
  });
});