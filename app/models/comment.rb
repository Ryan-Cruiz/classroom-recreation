class Comment < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :user
  validates :content,presence: true
  has_rich_text :content
end
