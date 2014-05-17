# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  $('html').click ->
    $('.menu').removeClass('open')

  $('#edit-user').click (event) ->
    event.stopPropagation()
    $('#menu-user').toggleClass('open')

  fitScreen = ->
    $('#panel-center').css('height', $('body').outerHeight() - 143)
    $('#main').css('width', $('body').outerWidth() - 360)
    $('.page-data').css('height', $('body').outerHeight() - 72)

  fitScreen()
  $(window).resize -> fitScreen()

  window.device = $('#main').data('device');
  $('#panel-center .option').click ->
    $('#panel-center .option').removeClass('selected')
    url = '/' + $(this).attr('id') + '/' + window.device
    $.get url, (data) ->
      $('#main').html data
      fitScreen()
    $(this).addClass('selected')

  $('#panel-center #sms').click();
