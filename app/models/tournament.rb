require json

class Tournament < ApplicationRecord
  has_many :registrations, dependent: :destroy
  accepts_nested_attributes_for :registrations, reject_if: :all_blank

  has_many :user_registrations, through: :registrations
  has_many :users, through: :user_registrations

  has_many :teams, dependent: :destroy

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def ongoing?
    status == "ongoing"
  end

  def coming?
    status == "coming"
  end

  def registration
    registrations.first
  end

  def participant_count
    UserRegistration.where(registration_id: self.registration.id).count
  end

  def create_teams
    team_count = participant_count / 3
    teams_names = ImportService.import_teams.shuffle!
    participant_infos = PlayerInfo.where(user: self.users).order(skill_rating: :desc)
    participant_tiers = participant_infos.each_slice(team_count).to_a
    team_count.times do |n|
      new_team = Team.create(name: teams_names[n], tournament: self)
      if new_team.save
        3.times { |i| UserTeam.create(team: new_team, user_id: participant_tiers[i][n].user_id) }
      end
    end
  end
end
