class JobUserRelationshipController < ApplicationController
  before_action :logged_in_user

  def create
  	job = Job.find(params[:job_id])
  	current_user.follow_job(job,current_user)
  	respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
  	JobUserRelationship.find_by(job_id: params[:job_id], user_id: current_user.id).destroy
  	respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end
end
