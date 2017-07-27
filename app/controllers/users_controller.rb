class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 4)
  end

  def new
    @user = User.new
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfuly"

      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to the AlphaBlog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
      if current_user != @user
        flash[:danger] = "You can only edit your own account"

        redirect_to root_path
      end
    end
end
