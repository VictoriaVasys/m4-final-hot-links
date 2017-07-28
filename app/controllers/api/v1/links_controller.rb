class Api::V1::LinksController < ApplicationController

  def index
    render json: Link.hot_links
  end
  
  def create
    link = Link.find_or_initialize_by(link_params)
    if link.save && link.update_reads
      render json: link
    else
      render status: 500, 
      json: {
        message: "Failed to add your link; #{@link.errors.full_messages}"
      }
    end
  end

  private

  def link_params
    params.permit(:url)
  end
  
end