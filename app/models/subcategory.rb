class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :medium, as: :categorisable
end
