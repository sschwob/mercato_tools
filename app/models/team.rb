class Team < ApplicationRecord
  NAMES = ["Leia", "Dengar", "Cere"]

  belongs_to :tournament
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  validates :name, presence: true
end
