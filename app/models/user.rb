class User < ApplicationRecord
    has_many :subjects
    has_many :specific_subjects
    has_many :posts
    # has_many :friends, through: :friendships
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :password, confirmation: true, presence: true
    # validates :password_confirmation, presence: true
    validates :user_type, presence:true, numericality: { greater_than: 0, less_than_equal: 2}

    before_save :downcase_email

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    private
        def downcase_email
          self.email.downcase!
        end
end
