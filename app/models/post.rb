class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  validates :title,:instructions, presence: true
end
