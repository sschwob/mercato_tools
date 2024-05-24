class Medium < ApplicationRecord
  belongs_to :media_kind
  belongs_to :categorisable, polymorphic: true

  LANGUAGES = ["FR", "EN"]

  validates :name, presence: true
  validates :language, presence: true
  validates :source, presence: true
end
