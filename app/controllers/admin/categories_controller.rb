class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all  
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfully created"
      redirect_to admin_category_path(@category)
    else
      flash[:error] = "Category creation failed"
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end