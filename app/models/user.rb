class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contents
  
  has_many :player_infos, dependent: :destroy
  has_many :user_teams, dependent: :destroy
  has_many :user_registrations, dependent: :destroy

  validates :ally_code, presence: true, uniqueness: true
  validates_length_of :ally_code, is: 9,  message: "Le code allié doit être composé de 9 chiffres"  

  before_create :create_player_infos

  def player_info
    player_infos.first
  end

  def has_avatar?
    player_info&.portrait_image&.present?
  end
  
  def avatar
    player_info.portrait_image
  end

  def create_player_infos
    self.player_infos << PlayerInfo.new
    data = ApiSwgohService.get_player_infos(ally_code)
    
    return if data.nil?
    
    self.username = data["data"]["name"]
    player_info.skill_rating = data["data"]["skill_rating"]
    player_info.portrait_image = data["data"]["portrait_image"]
  end
end
