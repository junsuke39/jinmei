# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $result = $('#result')
  $('form').on 'ajax:complete', (e, res, status)->
    if status == 'success'
      $result.html(res.responseText)
    else
      $result.empty()
