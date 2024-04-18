class Tweet < ApplicationRecord
  belongs_to :user

  validates :heading, :body, presence: true
end
