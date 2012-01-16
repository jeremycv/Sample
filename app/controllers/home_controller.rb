class HomeController < ApplicationController
  
  def index
    
    status = params[:status]

    selection = case params[:selection]
      
    when "Teams"
      @teams = Team.find_with_options(status)
    when "Skills"
		  @skills = Skill.find_with_options(status)
		when "Employees"
		  @employees = Employee.find_with_options(status)
	  else
	    ""
	  end
    
    respond_to do |format|
      format.html # show.html.erb
      format.js   # show rjs
    end
  end

end
