class SwgohApiController < ApplicationController
  skip_before_action :authenticate_user!

  def get_player_infos
    response = ApiSwgohService.get_player_infos(params["ally_code"])
    if response.nil?
      render json: { status: 404 }.to_json, status: 200
    else
      render json: { status: 200, name: response["data"]["name"] }.to_json, status: 200
    end
  end
end
