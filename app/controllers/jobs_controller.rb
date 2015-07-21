class JobsController < ApplicationController
	before_action :set_job, only: [ :show, :edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]

	def index
		@jobs = Job.all
		@prev_profession = params[:profession]
  		@prev_city = params[:city]

  		@jobs = @jobs.search(params[:search])
    	@jobs = @jobs.where("profession_id = ?", params[:profession] ) if params[:profession].present?
    	@jobs = @jobs.where("city_id = ?", params[:city] ) if params[:city].present?

    	@jobs = @jobs.paginate(page: params[:page], :per_page => 8)
	end

	def show
		
		sql = "SELECT jobs.* FROM jobs WHERE jobs.profession_id = ? ORDER BY id DESC LIMIT 2"
        @other_jobs_from_same_area = Job.find_by_sql [sql, @job.profession_id]

	end

	# GET /users/new
	def new
		@job = Job.new
	end

	def edit
	end

	def create
		@job = Job.new(job_params)
	    if @job.save
	      redirect_to @job
	    else
	      render 'new'
	    end
	end


	def update
		if @job.update_attributes(job_params)
	      flash[:success] = "Job updated"
	      redirect_to @job
	    else
	      render 'edit'
	    end
	end

	def destroy
		@job.destroy
		flash[:success] = "Job Deleted"
		redirect_to user_path(current_user)
	end

	private

		def set_job
      		@job = Job.find(params[:id])
    	end

    	# Never trust parameters from the scary internet, only allow the white list through.
	    def job_params
	    	params.require(:job).permit(:title, :description, :valid_from, :valid_to, :user_id, :salary, :type_of_contract, :profession_id, :active, :city_id, :search)
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
