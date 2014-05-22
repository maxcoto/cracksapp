# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  $('html').click ->
    $('.menu').removeClass('open')

  $('#edit-device').click (event) ->
    event.stopPropagation()
    $('#menu-device').toggleClass('open')

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

  autoClickPanel = ->
    $('#panel-center #location').click()

  autoClickPanel()


  $('.change-device').click ->
    newDevice = { name: $(this).html(), id: $(this).data('device') }

    $(this)
      .data('device', window.device)
      .html $('.device').html()

    $('.device').html(newDevice.name)
    $('#main').data('device', newDevice.id);

    window.device = newDevice.id
    autoClickPanel()


