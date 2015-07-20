class JobUserRelationshipsController < ApplicationController
	before_action :logged_in_user

  def create
    @jur = JobUserRelationship.new(job_id: params[:job_id] , user_id: params[:user_id])
    if @jur.save
      respond_to do |format|
        format.js {render inline: "location.reload();" }
      end
    else
      redirect_to root_url
    end
  end

  def destroy
  	 jur = JobUserRelationship.find_by(job_id: params[:job_id], user_id: params[:user_id])
     if jur
    	JobUserRelationship.find_by(job_id: params[:job_id], user_id: params[:user_id]).destroy
      respond_to do |format|
        format.js {render inline: "location.reload();" }
      end
    else
      redirect_to root_url
    end
  end
end
