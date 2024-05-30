class Content < ApplicationRecord
    belongs_to :media_kind
    belongs_to :category, optional: true
    belongs_to :user, optional: true

    LANGUAGES = ["FR", "EN"]

    validates :name, presence: true
    validates :media_kind, presence: true
    validates :language, presence: true
    validates :source, presence: true

    def author
        user_id.present? ? user.username : "-"
    end

    def video?
        media_kind.name == "Vidéo"
    end

    def img?
        media_kind.name == "Image"
    end

    def link?
        media_kind.name == "Lien"
    end
end
