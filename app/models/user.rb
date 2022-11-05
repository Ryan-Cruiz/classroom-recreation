class User < ApplicationRecord
    has_secure_password
    has_many :subjects
    has_many :specific_subjects
    has_many :posts
    has_one_attached :avatar
    # has_many :friends, through: :friendships
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :password, confirmation: true, presence: true, length: { in: 8..20 }, on: create
    # validates :password_confirmation, presence: true
    validates :user_type, presence:true, numericality: { greater_than: 0, less_than_equal: 2}

    before_save :downcase_email

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    def profile_image
      return unless avatar.content_type.in?(%w[image/png image/jpg image/jfif image/webp image/jpeg])
      avatar.variant(resize_to_limit: [150,150]).processed
    end
    def avatar_image
      return unless avatar.content_type.in?(%w[image/png image/jpg image/jfif image/webp image/jpeg])
      avatar.variant(resize_to_limit: [40,40]).processed
    end
    private
        def downcase_email
          self.email.downcase!
        end
end
