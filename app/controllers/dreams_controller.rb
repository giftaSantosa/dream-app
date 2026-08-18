class DreamsController < ApplicationController
  def index
    @dreams = Dream.all
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    if @dream.save
      redirect_to dreams_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def update
    params.require(:dream).permit(:title)
  end
end
