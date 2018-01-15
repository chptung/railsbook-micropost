class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :content, length: { maximum: 140 }, presence: true

  #def set_defaults
  #  if !self.publish_at
  #  self.status  ||= 'published'
  #    self.publish_at  ||= Time.now
  #  else
  #    self.status  ||= 'not_published'
  #  self.bool_field = true if self.bool_field.nil?
  # end

  # Every post has
  #  status - either PUBLISH_WAITING or PUBLISHED
  #  publish_at - date/time post need to be published
  #  published_at - actual time post was published (in this example it'll always be equal to publish_at)

  PUBLISH_WAITING, PUBLISHED = 'not_published', 'published'

  scope :publish_waiting, -> {
    where(status: Micropost::PUBLISH_WAITING)
  }
  scope :ready_for_publish, -> {
    where('publish_at <= ?', Time.now)
  }

  # Method to make post published!
  # Warn: it doesnt check if it is time to publish! Just do that.
  def publish_now!
    self.status = Micropost::PUBLISHED
    self.published_at = self.publish_at
    save!
  end
end
