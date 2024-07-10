class MediaKind < ApplicationRecord
    has_many :contents

    validates :name, presence: true
end
