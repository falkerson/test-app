class Ticket < ActiveRecord::Base
  belongs_to :status
  belongs_to :user

  has_many :replies

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :customer_email, :presence => true,
            :format => { :with => EMAIL_REGEX },
            :uniqueness => true
  validates :customer_name, :presence => true
  validates :subject, :presence => true
  validates :body, :presence => true
end