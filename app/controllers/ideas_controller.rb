class IdeasController < ApplicationController

  def show
    @user     = User.find(params[:user_id])
    @idea     = @user.ideas.find(params[:id])
    @category = category
  end

  def new
    @categories = Category.all
    @user       = User.find(params[:user_id])
    @idea       = Idea.new
  end

  def create
    @categories = Category.all
    @user       = User.find(params[:user_id])
    @idea        = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "New Idea Created."
      redirect_to @user
    else
      render :new
    end
  end

  private

  def category
     if @idea.category == nil
       "Category Not Found"
    else
      @idea.category.name
     end
  end

  def idea_params
    params.require(:idea).permit(:name, :description, :category_id)
  end

end
