class EnrollmentsController < ApplicationController
  
  def new
    
    @employee = Employee.find(params[:employee_id])
    @team = @employee.team
	  @enrollment = @employee.enrollments.build()
  end
 
  def create
    
    @employee = Employee.find(params[:employee_id])
    @team = @employee.team
 	  @enrollment = @employee.enrollments.build(params[:enrollment])
 	  
    if @enrollment.save
      
      #@employee.save  # save the employee in order to keep it upto date
		  redirect_to employee_url(@employee)
	  else
		  render :action => "new"
	  end
  end
  
  def show
    
 	  @enrollment = Enrollment.find(params[:id])
 	  @employee = @enrollment.employee
 	  @skill =  @enrollment.skill
 	  @team = @employee.team
  end
  
  def edit

	  @enrollment = Enrollment.find(params[:id])
 	  @employee = @enrollment.employee
 	  @skill =  @enrollment.skill
 	  @team = @employee.team
  end
  
  def update

    @enrollment = Enrollment.find(params[:id])
 	  @employee = @enrollment.employee
 	  @skill =  @enrollment.skill
 	  @team = @employee.team
 	  
    if @enrollment.update_attributes(params[:enrollment])
      redirect_to @employee
    else
      render :action => "edit"
    end
  end
  
  def destroy
    
  end
end
