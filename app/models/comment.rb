class Comment < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :user
  validates :content,presence: true
end
