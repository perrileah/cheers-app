class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.all
    render json: @checkins
  end

  def create
    @checkin = Checkin.create!(
      brewery_id: params[:brewery_id],
      user_id: params[:user_id],
      rating: params[:rating],
      image_url: params[:image_url],
      comments: params[:comments],
    )
    render :show
  end

  def show
    @checkin = Checkin.find_by(id: params[:id])
    render :show
  end

  def update
    @checkin = Checkin.find_by(id: params[:id])
    @checkin.update(
      brewery_id: params[:brewery_id],
      user_id: params[:user_id],
      rating: params[:rating],
      image_url: params[:image_url],
      comments: params[:comments],
    )
    render :show
  end

  def destroy
    @checkin = Checkin.find_by(id: params[:id])
    @checkin.destroy
    render json: { message: "Checkin destroyed successfully" }
  end
end
