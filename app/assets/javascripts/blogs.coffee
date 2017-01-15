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


appCtrl = [
  '$scope'
  ($scope)->
    $scope.textHoge = 'Lorem Ipsum'
    $scope.textFuga = 'Lorem Ipsum'

    $scope.addHoge = ->
      caret =  $scope.caretHoge.get
      text = $scope.textHoge
      if caret
        former = text.slice(0,caret)
        latter = text.slice(caret)
        $scope.textHoge = former + 'hoge' + latter
      else
        $scope.textHoge += 'hoge'
      return

    $scope.addFuga = ->
      caret =  $scope.caretFuga.get
      text = $scope.textFuga
      if caret
        former = text.slice(0,caret)
        latter = text.slice(caret)
        $scope.textFuga = former + '\n' + 'hoge' + '\n' + latter
      else
        $scope.textFuga += '\n' + 'hoge'
      return

    return
]

angular
  .module 'app',['eb.caret']
  .controller 'appCtrl', appCtrl

