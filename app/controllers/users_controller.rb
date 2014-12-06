class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show

  end

  def login
    
  end

  def logout

  end

  def new_student
    @student = User.new
    @schools = School.all
  end

  def new_teacher
    @teacher = User.new
    @schools = School.all
  end
  
  def create_student
    @student = User.new(user_params)
    respond_to do |format|
      if @student.save
        @student_table_save = @student.create_student
        redirect_to users_path
      else
        @schools = School.all
        format.html { render action: 'new_student' }
      end
    end
  end

  def create_teacher
    @teacher = User.new(user_params)
    respond_to do |format|
      if @teacher.save
        @teacher_table_save = @teacher.create_teacher
        redirect_to users_path
      else
        @schools = School.all
        format.html { render action: 'new_teacher' }
      end
    end
  end
  #def create
    
   # @my_user = User.create(user_params)
   # @student = @my_user.create_teacher
   # render :text =>@my_user.inspect
  #end

  private 
  def user_params
    params.require(:user).permit(:first, :last, :school_id, :user_type, :email, :password)
  end
end
