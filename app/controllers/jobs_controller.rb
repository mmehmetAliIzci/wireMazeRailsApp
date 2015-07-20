class JobsController < ApplicationController
	before_action :set_user, only: [ :show, :edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]

	def index
		@jobs = Job.all
		@prev_profession = params[:profession]
  		@prev_city = params[:city]
	end

	def show
	end

	def edit
	end

	def create
		@job = User.new(job_params)
	    if @job.save
	      redirect_to @job
	    else
	      render 'new'
	    end
	end


	def update
		if @job.update_attributes(job_params)
	      flash[:success] = "Profile updated"
	      redirect_to @job
	    else
	      render 'edit'
	    end
	end

	def destroy
		@job.destroy
		redirect_to user_path(current_user)
	end

	private

		def set_user
      		@job = Job.find(params[:id])
    	end

    	# Never trust parameters from the scary internet, only allow the white list through.
	    def job_params
	    	params.require(:job).permit(:title, :description, :valid_from, :valid_to, :user_id, :salary, :type_of_contract, :profession_id, :active)
	    end

	    # Confirms the correct user.
	    def correct_user
	      @user = Job.find(params[:id]).user
	      if isAdmin?(current_user) || current_user?(@user)

	      else
	        redirect_to(root_url) 
	      end
	    end
end
