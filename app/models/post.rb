class Post < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :postcomments, dependent: :destroy
  validates :title,:content, presence: true
  has_many :all_posts, as: :imageable
  has_rich_text :content
end
