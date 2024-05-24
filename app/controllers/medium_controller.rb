class MediumController < ApplicationController
    skip_before_action :authenticate_user!

    def index
        @medias = Medium.where(categorisable_id: params["id"], categorisable_type: params["type"])
    end
end
