class DreamsController < ApplicationController
  # skip_before_action :authenticate_user!
  def index
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = User.first

    if @dream.save
      redirect_to dream_path(@dream)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def update
  end

  private

  def dream_params
    params.require(:dream).permit(:input, :date, :mood)
  end
end
