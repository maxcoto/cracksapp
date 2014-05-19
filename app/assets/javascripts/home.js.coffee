# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  $('.install-btn').click ->
    $('#install-step').attr('src', '/assets/usecases/use-case-' + $(this).data('index') + '.png');

