class Admin::UsersController < Admin::BaseController

  def index
    @search = User.search(params[:q])
    @users = @search.result
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    flash[:success] = "#{user.name} successfully deleted."
    redirect_to admin_users_path
  end

end
