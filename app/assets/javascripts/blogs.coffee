# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
blogready = ->
  $('#calendarBlogs').fullCalendar events: '/blogs.json',

#$(document).ready(blogready)
#$(document).on 'page:load', ->
#  blogready
#$ ->
#  alert('asdfasdf')

#$(document).on 'page:load', ->
#alert("sdfasdffas")
#

$(document).on 'ready page:load', ->
  UI = new SquireUI(
    replace: 'textarea#seditor'
    buildPath: "/"
    height: 300)
  
  if typeof $squire_description != 'undefined'
    UI.setHTML $squire_description

  $('form').submit ->
    $('#squire_description').val(UI.getHTML()).change()
    return
