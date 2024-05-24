class Category < ApplicationRecord
    has_many :subcategories
    has_many :medium, as: :categorisable

    validates :name, presence: true

    def has_subcategories?
        subcategories.present?
    end
end
