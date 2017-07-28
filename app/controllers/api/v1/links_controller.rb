class Api::V1::LinksController < ApplicationController

  def index
    render json: Link.hot_links
  end
  
end