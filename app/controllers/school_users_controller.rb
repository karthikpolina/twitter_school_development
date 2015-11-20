class SchoolUsersController < ApplicationController
  before_action :set_school_user, only: [:show, :edit, :update, :destroy]

  # GET /school_users
  # GET /school_users.json
  def index
    @school_users = SchoolUser.all
  end

  # GET /school_users/1
  # GET /school_users/1.json
  def show
  end

  # GET /school_users/new
  def new
    @school_user = SchoolUser.new
  end

  # GET /school_users/1/edit
  def edit
  end

  # POST /school_users
  # POST /school_users.json
  def create
    @school_user = SchoolUser.new(school_user_params)

    respond_to do |format|
      if @school_user.save
        format.html { redirect_to @school_user, notice: 'School user was successfully created.' }
        format.json { render :show, status: :created, location: @school_user }
      else
        format.html { render :new }
        format.json { render json: @school_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_users/1
  # PATCH/PUT /school_users/1.json
  def update
    respond_to do |format|
      if @school_user.update(school_user_params)
        format.html { redirect_to @school_user, notice: 'School user was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_user }
      else
        format.html { render :edit }
        format.json { render json: @school_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_users/1
  # DELETE /school_users/1.json
  def destroy
    @school_user.destroy
    respond_to do |format|
      format.html { redirect_to school_users_url, notice: 'School user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_user
      @school_user = SchoolUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_user_params
      params.require(:school_user).permit(:first_name, :last_name, :email_id, :contact, :login_id, :password, :role_id, :school_id)
    end
end
