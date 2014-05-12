# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  # Style Fixes
  $('#panel-center').css('height', $('body').outerHeight() - 140)
  $('#main').css('width', $('body').outerWidth() - 360)
  # End - Style Fixes


  device = $('#main').data('device');

  $('#panel-center .option').click ->

    $('#panel-center .option').removeClass('selected')

    url = '/' + $(this).attr('id') + '/' + device
    $.get url, (data) ->
      $('#main').html data

    $(this).addClass('selected')

  $('#panel-center #general').click();
