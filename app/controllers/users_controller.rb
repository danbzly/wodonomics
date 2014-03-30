class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = current_user.users.build
  end

  def edit
  end
  
  def create
    @user = current_user.users.build(user_params)
      if @user.save
       redirect_to @user, notice: 'User was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
    
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render action: 'edit'
      end
  end
  
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end


    def correct_user
      @user = current_user.users.find_by(id: params[:id])
      redirect_to user_path, notice: "Not authorized to edit this User" if @user.nil?
    end
    
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :firstname)
    end
end
