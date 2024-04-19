class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :tweet_post, dependent: :destroy

  validates :heading, :body, presence: true

  validate :validate_image

  private

  def validate_image
    if tweet_post.attached?
      if !tweet_post.blob.content_type.in?(%w[image/jpeg image/png video/mp4])
        errors.add(:tweet_post, "Add Only JPEG or PNG or MP4 files")
      end
    end
  end
end
