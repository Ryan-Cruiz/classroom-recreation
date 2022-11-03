class Subject < ApplicationRecord
  belongs_to :user
  has_many :specific_subjects
  has_many :posts
  validates :title, :section, presence: true, length: { minimum: 2}
end
