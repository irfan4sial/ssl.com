class Team < ApplicationRecord
  belongs_to :admin

  has_many :team_memberships
  has_many :users, through: :team_memberships
  accepts_nested_attributes_for :team_memberships, allow_destroy: true
end
