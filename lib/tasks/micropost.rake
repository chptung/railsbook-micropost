# lib/tasks/posts.rake
#  Define rake `posts:publish` task,
#  which when called searches through all not published
#  (but ready to be published) posts and publishes them.
#  You can call that task manually from CLI `$ rake micropost:publish` to check.
namespace :microposts do
  desc "Publish posts with cron on certain time"
  task :publish => :environment do
    Micropost.publish_waiting.ready_for_publish.find_each do |micropost|
      micropost.publish_now!
    end
  end
end
