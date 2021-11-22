class PicsController < ApplicationController

  def index
  end

  def new
    @pic = Pic.new
  end

  # does not have a view file, responsible for create logic
  def create 
    @pic = Pic.new(pic_params)
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description)
  end

end
