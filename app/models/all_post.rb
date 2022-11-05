class AllPost < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :subject
  belongs_to :user
end
