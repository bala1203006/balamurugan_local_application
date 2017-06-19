class UsersController < ApplicationController
  before_action :verify_admin, :only => ["index"]
  before_action :verify_user, :only => ["show", "edit", "update"]
  before_action :only_admin, :only => ["edit", "update", "show"]

def index
end
  def create
    @user=User.new(params_user)
    @user.save
    redirect_to user_path(@user)
  end

  def show
    @user=User.find_by_id(params[:id])
    redirect_to root_path unless @user
  end

  def new
    @user=User.new
  end

  def edit
    @user=User.find_by_id(params[:id])
    redirect_to root_path unless @user
  end

  def update
        @user = User.find_by_id(params[:id])
    if @user.update(params_user)
      redirect_to root_path, notice: 'User was successfully updated.' 
    end       
  end

def only_admin
  params[:id] = session[:user_id] unless session[:role] == "ADMIN"
end
  private

   def params_user
     params.require(:user).permit(:name,:phone_no,:email,:password,:father_name,:mother_name,:profession,:city,:state,:country)
   end


end
