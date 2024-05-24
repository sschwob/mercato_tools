class Medium < ApplicationRecord
  belongs_to :media_kind
  belongs_to :subcategory
end
