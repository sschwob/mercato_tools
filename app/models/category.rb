class Category < ApplicationRecord
    has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
    belongs_to :parent, class_name: 'Category', optional: true

    has_many :contents

    validates :name, presence: true

    def self.filtered_grouped_categories
        categories = where.missing(:subcategories).or(where.not(parent_id: nil)).includes(:parent).order(name: :asc)
        categories.group_by(&:parent)
    end

    def self.sidebar_categories
        where(parent_id: nil).order(:name)
    end

    def has_subcategories?
        subcategories.present?
    end

    def has_content?
        Content.where(category_id: id).present?
    end

    def contents_count
        Content.where(category_id: id).count
    end
end
