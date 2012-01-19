# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def show_skills

    @team = Team.find(params[:id])
    @skills = @team.skills

     respond_to do |format|
       format.js
     end
  end
  
  def hide_skills
   
    respond_to do |format|
       format.js
    end
  end
  
  def show_enrollments

    @salary_number = params[:id]
    @employee = Employee.find_by_employee_id(params[:id])
    @enrollments = @employee.enrollments

    respond_to do |format|
       format.js
    end
   end

   def hide_enrollments

      @salary_number = params[:id]

      respond_to do |format|
         format.js
      end
  end
  
end
