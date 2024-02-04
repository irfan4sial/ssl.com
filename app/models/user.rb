class User < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true, format: { with: /\A\w+\z/, message: 'can only contain alphanumeric characters' }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'is not a valid email address' }
  validates :password_digest, presence: true, length: { minimum: 6 }, confirmation: true
  
  has_many :team_memberships
  has_many :teams, through: :team_memberships
  accepts_nested_attributes_for :team_memberships, allow_destroy: true

  has_many :user_roles
  has_many :roles, through: :user_roles    
  belongs_to :admin  
  
  accepts_nested_attributes_for :user_roles

end
