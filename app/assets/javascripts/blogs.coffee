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

angular.module('sampleApp').controller 'TodoListCtrl', ($scope) ->

  $scope.init = ->
    $scope.list =
      'name': 'Todoリスト1'
      'todos': [
        { 'description': 'todo description1' }
        { 'description': 'todo description2' }
      ]


angular.module('sampleApp', []).controller 'AppController', ($scope) ->
  $scope.username = ''
  $scope.users = []

  $scope.submit = ->
    $scope.users.push
      username: $scope.username
      url: '//twitter.com/' + $scope.username
    return
  return


angular.module('sampleApp').controller 'TodoListCtrl', ($scope) ->

  $scope.init = ->
    $scope.list = {
      'name': 'Angularjsテスト中'
      'todos': [
        { 'description': 'todo description1' }
        { 'description': 'todo description2' }
      ]
    }

