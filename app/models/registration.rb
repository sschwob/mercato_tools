class Registration < ApplicationRecord
  belongs_to :tournament
  has_many :user_registrations, dependent: :destroy
  has_many :users, through: :user_registrations

  validates :start_date, presence: true
  validates :end_date, presence: true

  def status
    if end_date < DateTime.now
      "closed"
    elsif start_date < DateTime.now
      "opened"
    else
      "coming"
    end
  end

  def opened?
    status == "opened"
  end

  def coming?
    status == "coming"
  end

  def is_user_registered?(user)
    UserRegistration.find_by(user_id: user.id).present?
  end
end
