class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  
  def login
    render
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = Parent.where(:login_id => params[:username] ).first
      if found_user
        
      # TODO: mark user as logged in
      session[:parent_id] = found_user.id
      
      redirect_to(:controller => 'students' ,:action => 'studentSchoolActivities', :method => :post)
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end
  end

  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.all
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
  end

  # GET /parents/new
  def new
    @parent = Parent.new
    @parent.students.build

    @classregistration = Classroom.new

    @classroomId = params[:classroomId]
    #@student.class_registration.build


  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
      #@classregistration = ClassRegistration.new(class_registration_params) 
    
    
    @parent = Parent.new(parent_params)

    respond_to do |format|
      if @parent.save

        studentId = Student.select("id").where("parent_id = "+ @parent.id.to_s)

        regObj = ClassRegistration.new
        regObj.student_id = studentId[0].id
        regObj.classroom_id = params[:classroomId]
        regObj.save

        format.html { redirect_to controller: 'students', action: 'index', classroomId: params[:classroomId] , notice: 'Parent was successfully created.' }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:mom_fname, :mom_lname, :dad_fname, :dad_lname, :email_id, :contact, :login_id, :password,students_attributes: [:id,:first_name, :last_name, :dob, :emergency_contact, :address_line1, :address_line2, :city, :zip, :state, :country])
        
    end

    def class_registration_params
      params.require(:class_registration).permit(:student_id)
    end
end
