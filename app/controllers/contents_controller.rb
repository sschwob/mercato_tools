class ContentsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]
    before_action :check_user_admin, only: [:contents_to_validate, :edit]
    before_action :find_content, only: [:show, :edit, :update, :delete]

    def contents_to_validate
        @contents_to_validate = Content.where(enable: false)
    end

    def index
        @contents = Content.where(category_id: params["id"], enable: true)
    end

    def show
    end

    def new
        @content = Content.new
    end

    def create
        @content = Content.new(content_params)
        @content.user = current_user
        if @content.save
            message = @content.enable ? "Le contenu a été publié avec succès" : "Le contenu a été ajouté avec succès. Cependant, un administrateur doit le valider." 
            redirect_to root_path, notice: message
        else
            render :new, status: 422
        end
    end

    private

    def find_content
        @content = Content.find(params["id"])
    end

    def content_params
        params.require(:content).permit(:name, :media_kind_id, :language, :source, :description, :category_id, :enable)
    end
end
