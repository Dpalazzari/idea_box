class Admin::CategoriesController < Admin::BaseController

  def index
    @search = Category.search(params[:q])
    @categories = @search.result
    @cats = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "category created"

      redirect_to admin_categories_path
    else
      flash[:failure] = "Categories must have names"
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.name} successfully destroyed."
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
