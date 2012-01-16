class SkillsController < ApplicationController
  
  def new

    @team = Team.find(params[:team_id])
 	  @skill = @team.skills.build
  end

  def create

    @team = Team.find(params[:team_id])
 	  @skill = @team.skills.build(params[:skill])

    if @skill.save
 		  redirect_to team_url(@team)
 	  else
 		  render :action => "new"
 	  end
  end
  
  def show
    
    @skill = Skill.find(params[:id])
    @team = @skill.team
    @enrollments = @skill.enrollments
    
  end
   
   def edit

     @skill = Skill.find(params[:id])
     @team = @skill.team
     @enrollments = @skill.enrollments
        
   end
   
   def update

     @skill = Skill.find(params[:id])
     @team = @skill.team
     
     if @skill.update_attributes(params[:skill])
        redirect_to @skill
      else
        render :action => :edit
      end
    end
   
end
