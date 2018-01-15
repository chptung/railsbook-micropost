#  Once wheneverifyed - asks cron to call rake task `posts:publish` every minute.
#  See whenever docs at https://github.com/javan/whenever.
set :output, "log/cron_log.log"
env :PATH, ENV['PATH']

every 1.minute do
  rake 'microposts:publish', environment: environment
end
