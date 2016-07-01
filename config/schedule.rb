# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
#set :output, "/path/to/my/cron_log.log"
#
require File.expand_path(File.dirname(__FILE__) + "/environment")
puts File.expand_path(File.dirname(__FILE__) + "/environment")
# 1分毎にa回す
 every 1.minute do
   command "echo 'mossmossmossmossmossmoss'"
  end
#
#   every 3.hours do
#     runner "MyModel.some_process"
#       rake "my:rake:task"
#         command "/usr/bin/my_great_command"
#         end
#
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
