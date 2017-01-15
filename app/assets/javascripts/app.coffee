# AngularJSの設定ファイル
# 依存ライブラリを記述する
app = angular.module('sampleApp', [])

# CSRFのトークンを設定するようにする
app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

blogready = ->
  $('#calendarBlogs').fullCalendar events: '/blogs.json'

ready = ->
  $.pjax area: '#container'
  $(document).bind 'pjax:render', ->
    $('#container').attr 'class': 'fadeInUp'
    blogready()
    $('#calendarJournals').fullCalendar events: '/journals.json'
    $('#calendar').fullCalendar events: '/events.json'

$(document).ready(ready)
$(document).ready(blogready)
