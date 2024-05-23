class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :player_info

  validates :username, presence: true, uniqueness: true
  validates :ally_code, presence: true, uniqueness: true
  validates :ally_code, numericality: { greater_than_or_equal_to: 0 }

  def avatar
    self.player_info.portrait_image
  end
end
