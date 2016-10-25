class ViewingsController < ApplicationController
  before_action :set_viewing, only: [:show, :update, :destroy]

  # GET /viewings
  def index
    @viewings = Viewing.all

    render json: @viewings
  end

  # GET /viewings/1
  def show
    render json: @viewing
  end

  # POST /viewings
  def create
    @viewing = Viewing.new(viewing_params)

    if @viewing.save
      render json: @viewing, status: :created, location: @viewing
    else
      render json: @viewing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /viewings/1
  def update
    if @viewing.update(viewing_params)
      render json: @viewing
    else
      render json: @viewing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /viewings/1
  def destroy
    @viewing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viewing
      @viewing = Viewing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def viewing_params
      params.require(:viewing).permit(:user_id, :movie_id, :watched)
    end
end
