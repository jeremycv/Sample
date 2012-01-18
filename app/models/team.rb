class Team < ActiveRecord::Base
  
  include ApplicationHelper
  
  before_save :calculate_status unless @team.nil?
  
  has_many :employees, :order => "name", :dependent => :destroy
  has_many :skills, :order => "name", :dependent => :destroy
  
  validates_presence_of :name, :message => " - Surely a team needs a team name!!"
  
  def get_status(team_id = nil)
    
    states = Employee.find(:all, :select => "status", :conditions => {:team_id => "#{team_id}"}, :group => "status").collect {|c| c.status}
	
		if states.include?("Red")
			"Red"
		elsif states.include?("Amber")
			"Amber"
		elsif states.include?("Green")
			"Green"
		end
  end
  
  private
  
  def calculate_status()
    self.status = get_status(id)
  end
  
  def self.find_with_options(status = nil)

    eval(Team.return_search(status))
  end
  
  def self.return_search(status)
    
    search_string = "Team.find :all, :order => 'name'"

    if status != "All" and status != ""
      search_string = search_string + ", :conditions => \"status = '#{status}'\""
    end
    return search_string
  end
  
end
