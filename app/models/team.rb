class Team < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :team_memberships
  has_many :users, through: :team_memberships
end
