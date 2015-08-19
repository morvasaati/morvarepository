class ProfilesController < ApplicationController
  # load_and_authorize_resource :except => :homepage
  before_action :authenticate_user! , :except => [:mannagers, :ourprojects ,  :homepage , :memari , :saze , :tasisat,:taghdirname,:darbareyema ,:tamasbama]
  before_action :set_profile, only: [:show, :edit, :update, :destroy , :addUser]
  before_action :check_admin , only: [:addUser]
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @projects = Project.all 
    @user = current_user
  end

  def newUser
    @user = User.new
  end

  def addUser

    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'user was successfully created.' }
      else
        format.html { render :newUser }
      end
    end

  end
  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mannagers
  end

  def ourprojects
  end


  def memari
  end

  def saze
  end

  def tasisat
  end

  def tamasbama
    redirect_to "contacts/new"
  end

  def darbareyema
  end

  def taghdirname
  end

  def download
    send_file(@filename, :filename => "Binder1 opt.pdf")
  end

  private
    def check_admin
      unless current_user.role ==  "ادمین"
        redirect_to root_url
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:company_name, :work_experience, :register_number, :tel, :fax, :image , :avatar , :user_id)
    end
    def user_params
      params.require(:user).permit(:email, :password_confirmation, :password, :role ,:company_name , :work_experience , :register_number , :tel ,:fax)
    end
end
