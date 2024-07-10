class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team, autosave: true
end
