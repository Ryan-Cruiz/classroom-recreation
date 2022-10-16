class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :postcomments, dependent: :destroy
  validates :title,:content, presence: true
end
