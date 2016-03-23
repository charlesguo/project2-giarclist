class StaticController < ApplicationController
  def index
    render "index.html"
  end

  def show
    render params[:page]
  end
end
