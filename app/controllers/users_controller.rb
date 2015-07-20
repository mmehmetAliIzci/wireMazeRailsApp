class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,   only: [:destroy]
  before_action :set_user, only: [ :show, :edit, :update, :destroy,:following, :followers]
  
  

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    if logged_in?
      #if user is seeing its own page
      if current_user?(@user)
        #if user is canditate redirect to canditate_home
        if @user.type_of_users == 1 
          sql = "SELECT j.* FROM jobs j INNER JOIN (SELECT job_id FROM job_user_relationships jur WHERE jur.user_id = ?) as fp ON (j.id = fp.job_id)"
          @jobs_interested = JobUserRelationship.find_by_sql [sql, @user.id]
          #@companies_interested 
          @jobs_interested = @jobs_interested.paginate(page: params[:jobs_page] ,:per_page => 3)
          @companies_interested_to_me = @user.followers.paginate(page: params[:companies_page],:per_page => 3)
          render "canditate_home"
        #if user is company redirect to company_home
        elsif @user.type_of_users == 2 
          #@canditates_interested
          @jobs_served = @jobs_served = Job.where("user_id = ?", @user.id )
          @jobs_served = @jobs_served.paginate(page: params[:jobs_page], :per_page => 3)
          @canditates_interested_to_me = @user.followers.paginate(page: params[:companies_page],:per_page => 3)
          render "company_home"
        #if user is canditate admin to admin_home
        elsif @user.type_of_users == 3 
          render "admin_home"
        end  
      #if user seeing another users page
      else
        # GET /users/1
      end
    else
      #if user is not logged in
      # GET /users/1
    end
  end

  # GET /users/new
  def new
    @user = User.new
    @user.type_of_users = params[:user_type]
    if params[:user_type] == 1
      render "users/new"
    elsif params[:user_type] == 2
      render "users/new_company"
    end
    
  end

  def before_sign_up
    render "users/before_sign_up"
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.type_of_users = params[:type_of_users]
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :address, :post_code, :contact, :personal_page, :birthday, :id_number, :presentation, :habits, :experience, :type_of_users, :active)
    end

    # Before filters
    
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      if isAdmin?(current_user) || current_user?(@user)

      else
        redirect_to(root_url) 
      end
    end

    def admin_user
      redirect_to(root_url) unless isAdmin?(current_user)
    end
    
end
