class DreamsController < ApplicationController
  def index
    @dreams = Dream.all
  end

  def new
    @dream = Dream.new
  end

  def create
  end

  def show
  end

  def update
  end
end
