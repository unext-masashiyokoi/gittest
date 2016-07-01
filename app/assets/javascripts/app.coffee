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

#$(document).on 'page:load', ->
 # blogready

# AngularJSがturbolinksと一緒に動くようにする
#$(document).on 'page:load', ->
#  ready
 # $('[ng-app]').each ->
  #  alert('ngapp')
   # module = $(this).attr('ng-app')
    #angular.bootstrap(this, [module])
 # blogready


$(document).ready(ready)
#$(document).on 'page:load', ->
#  ready
$(document).ready(blogready)
