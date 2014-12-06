class SchoolsController < ApplicationController
  layout "school"
  def index

  end

  def show
  end

  def new
    @school = School.new
  end
    
  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to schools_path
    else
      format.html {render action: 'new'}
    end
  end

  private
  def school_params
    params.require(:school).permit(:name, :city, :state, :country)
  end
end
