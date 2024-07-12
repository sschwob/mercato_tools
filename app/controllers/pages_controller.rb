class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @last_contents = Content.where(enable: true).order(created_at: :desc).limit(10)
  end
end
