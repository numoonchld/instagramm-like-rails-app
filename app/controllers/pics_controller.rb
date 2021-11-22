class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show 
  end
  
  def new
    @pic = Pic.new
  end
  
  # does not have a view file, responsible for "creation" logic
  def create 
    @pic = Pic.new(pic_params)
    
    if @pic.save
      redirect_to @pic, notice: "Pic was posted"
    else 
      render 'new'
    end
    
  end

  def edit
  end

  # does not have a view file, responsible for "updation" logic
  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Pic was updated"
    else 
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  
  private
  
  def pic_params
    params.require(:pic).permit(:title, :description)
  end
  
  def find_pic
    @pic = Pic.find(params[:id])
  end

end
