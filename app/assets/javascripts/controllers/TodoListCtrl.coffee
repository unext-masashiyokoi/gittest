
angular.module('sampleApp').controller "TodoListCtrl", ($scope) ->
  # 初期データを用意するメソッド
  # $scope.list.name  としてアクセスできる
  # $scope.list.todos としてアクセスできる
  $scope.init = ->
    $scope.list = {
      'name'  : 'Todoリスト1',
      'todos' : [
        { 'description' : 'todo description1'},
        { 'description' : 'todo description2'}
      ]
    }


  # 初期データを用意するメソッド
  # $scope.list.name  としてアクセスできる
  # $scope.list.todos としてアクセスできる
  $scope.init = ->
    $scope.list = {
      'name'  : 'cant resist',
      'todos' : [
        { 'description' : 'sample1'},
        { 'description' : 'sample2'}
      ]
    }


  # todoを追加する
  $scope.addTodo = (todoDescription) ->
    # 新しいtodoを作成する
    todo = { 'description' : todoDescription }

    # initメソッドで用意したtodosの一番最初にtodoを追加する
    $scope.list.todos.unshift(todo)

    # Todo入力テキストフィールドを空にする
    $scope.todoDescription = ""
