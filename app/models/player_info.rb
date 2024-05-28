class PlayerInfo < ApplicationRecord
  belongs_to :user, autosave: true
end
