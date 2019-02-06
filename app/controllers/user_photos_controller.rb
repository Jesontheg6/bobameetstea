class UserPhotosController < ApplicationController
  before_action :set_user_photo, only: [:show, :update, :destroy]

  # GET /user_photos
  def index
    @user_photos = UserPhoto.all

    render json: @user_photos
  end

  # GET /user_photos/1
  def show
    render json: @user_photo
  end

  # POST /user_photos
  def create
    @user_photo = UserPhoto.new(user_photo_params)

    if @user_photo.save
      render json: @user_photo, status: :created, location: @user_photo
    else
      render json: @user_photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_photos/1
  def update
    if @user_photo.update(user_photo_params)
      render json: @user_photo
    else
      render json: @user_photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_photos/1
  def destroy
    @user_photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_photo
      @user_photo = UserPhoto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_photo_params
      params.fetch(:user_photo, {})
    end
end
