class CatsController < ApplicationController
  before_action :find_cat, except: [:index, :new, :create]

  def index
    @cats = Cat.all
  end    

  def new
    @cat = Cat.new
  end
  
  def create
    @cat =  Cat.new(cat_params)

    if @cat.save
      redirect_to cats_path, notice: 'Cat Created !'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    if @cat.update(cat_params)
      redirect_to cats_path, notice: 'Cat Updated !'
    else
      render :edit
    end
  end

  def destroy
    @cat.destroy
    redirect_to cats_path, notice: 'Cat Deleted !'
  end

  private
  
  def cat_params
    params.require(:cat).permit(:name, :age, :breed)
  end

  def find_cat
    @cat = Cat.find_by!(id: params[:id])
  end
end
