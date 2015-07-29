class BackofficeController < ApplicationController
	before_action :set_user, only: [ :show_user, :edit_user, :update_user, :destroy_user, :change_user_password, :update_user_password]
	before_action :set_notice, only: [ :show_notice, :edit_notice, :update_notice, :destroy_notice]
	before_action :logged_in_user
	before_action :admin_user

	def index_users
		@users = User.all.search(params[:search]).paginate(page: params[:page], :per_page => 8)
	end

	def show_user
	end

	def edit_user
	end

	def update_user
      if @user.update(user_params)
      	flash.now[:notice] = "User Updated Successfully"
      	render 'backoffice/show_user'
      else
      	flash.now[:danger] = "User Update Failed"
        redirect_to backoffice_user_edit_path(@user)
      end
	end

	def change_user_password 
		render 'backoffice/change_password_user'
	end

	def update_user_password
		if params[:user][:password] == params[:user][:password_confirmation] && @user.update(user_pass_params)
			flash[:info] = "User password successfully updated.."
	        redirect_to backoffice_user_edit_path(@user)
	    else
	      flash[:danger] = "Please check the fields"
	      render "backoffice/change_password_user"
		end
	end

	def destroy_user
		@user.destroy
	    redirect_to backoffice_users_all_path
	end

#notices
	def index_notices
		@notices = Notice.all.search(params[:search]).paginate(page: params[:page], :per_page => 8)
		
	end

	def show_notice
	end

	def create_notice
	end

	def edit_notice
	end

	def update_notice
	end

	def destroy_notice
	end

private
	# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :active)
    end

    def user_pass_params
    	params.require(:user).permit(:password, :password_confirmation)
    end

    def notice_params
    	params.require(:user).permit(:password, :password_confirmation)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
    	@user = User.find(params[:format])
    end

    def set_notice
    	@notice = Notice.find(params[:format])
    end

end
