class TeamsController < ApplicationController
  
  def new
    
    @team = Team.new
  end
  
  def create
    
    @team = Team.create(params[:team])
    if @team.save
      redirect_to @team
    else
      render :action => :new
    end
  end
  
  def index
    
    @teams = Team.find(:all, :order => :name)
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def show
    
    @team = Team.find(params[:id])
    @employees = @team.employees
    @skills = @team.skills
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def edit
    
    @team = Team.find(params[:id])
  end
  
  def update

    @team = Team.find(params[:id])
    
    if @team.update_attributes(params[:team])
       redirect_to @team
    else
       render :action => :edit
    end
  end
   
end