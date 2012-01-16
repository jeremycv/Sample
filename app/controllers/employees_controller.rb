class EmployeesController < ApplicationController
  
  def index
    
  end

  def new
    
    @team = Team.find(params[:team_id])
	  @employee = @team.employees.build
  end
 
  def create
    
    @team = Team.find(params[:team_id])
	  @employee = @team.employees.build(params[:employee])
    
    if @employee.save
		  redirect_to team_url(@team)
	  else
		  render :action => "new"
	  end
	  
  end

  def show
    
    @employee = Employee.find(params[:id])
    @team = @employee.team
    #@enrollments = @employee.enrollments
    @enrollments = Enrollment.find(:all, :conditions => {:employee_id => "#{params[:id]}"}, :order => "skill_id")
    
  end
   
   def edit

    @employee = Employee.find(params[:id])
    @team = @employee.team
    #@enrollments = @employee.enrollments
    @enrollments = Enrollment.find(:all, :conditions => {:employee_id => "#{params[:id]}"})
        
   end
   
   def update

    @employee = Employee.find(params[:id])
    @team = @employee.team
     
     if @employee.update_attributes(params[:employee])
        redirect_to @employee
      else
        render :action => :edit
      end
    end

  def destroy
    
  end

end
