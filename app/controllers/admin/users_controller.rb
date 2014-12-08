module Admin
	class UsersController < ApplicationController
		
		# user_type values : 1=teacher, 2=student
		layout 'admin'
		def index
			@users = User.all
			@schools = School.all
			respond_to do |format|
				format.html {}
				format.json {render json: @users.to_json}
			end
		end

		def teachers
			@teachers = Teacher.all
		end

		def students
			@students = Student.all
		end

		#this will display the information for one user
		def show
			@user = User.find_by_id(params[:id])
			@schools = School.all
		end

		def edit_user
			
		end

		def destroy
			@data = params
			respond_to do |format|
				#format.html {}
				format.json {render json: @data.to_json}
			end
		end

		def update
			@data = Hash.new
			@data["success"] = false
			@user = User.find(params[:id])
			if(params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
				@user.updating_password = false
				params[:user].except!(:password, :password_confirmation)
			else
				@user.updating_password = true
			end
			
			respond_to do |format|
				if @user.update_attributes(user_params)
					@data['success'] = true
					@data['user'] = @user
					@data['message'] = "User Information has been updated."
					format.json {render json: @data.to_json}
			
				else 
					@data['errors'] = @user.errors
					format.json {render json: @data.to_json}
				end
			end
		end
		#end update

		private
		def user_params
    		params.require(:user).permit(:first, :last, :school_id, :user_type, :email, :password, :password_confirmation)
		end

		
	end
end
