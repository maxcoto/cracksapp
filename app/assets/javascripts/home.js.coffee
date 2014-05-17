# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  fitToScreen = ->
    _body = $('body').outerHeight() / 2;
    _height = $('.sign .centered').height() / 2;
    $('.sign .centered').css('padding-top', _body - _height);

  fitToScreen()
  $(window).resize -> fitToScreen()

