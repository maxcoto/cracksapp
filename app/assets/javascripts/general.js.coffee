# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  show = ->
    $('#no-editing-name').hide()
    $('#editing-name').show()
    $('#new-name')
      .val $('#current-name').html()
      .focus()

  hide = ->
    $('#editing-name').hide()
    $('#no-editing-name').show()
    

  $('#main').on 'click', '.edit-name', ->
    show()

  setNewName = ->
    newName = $('#new-name').val()
    url = '/devices/' + window.device + '/change/' + newName
    $.get url
    $('#current-name, .device').html newName
    hide()

  $('#main').on 'click', '.set-new-name', -> setNewName()

  $('#main').on 'keyup', '#new-name', (e) -> if e.which == 13 then setNewName()      

  $('#main').on 'click', '.cancel-name', ->
    hide()

  


