class Employee < ActiveRecord::Base
  
  include ApplicationHelper
    
  belongs_to :team
  has_many :skills, :through => :enrollments
  has_many :enrollments, :dependent => :destroy
  
  before_save :calculate_status
  after_save  :save_team
  
  validates_presence_of :name, :message => " - Each employee should be called by his/her name. No one likes being called Oi Oi."
  validates_presence_of :employee_id, :message => " - The Employee Salary number is a required piece of information."""
  validates_uniqueness_of :employee_id, :message => "- The Employee Salary number must be unique. No two employees should have the same salary number"


  def get_status(emp_id = nil)
    
    states = Enrollment.find(:all, :select => "status", :conditions => {:employee_id => "#{emp_id}", :reportable => true}, :group => "status").collect {|c| c.status}
	
		if states.include?("Red")
			"Red"
		elsif states.include?("Amber")
			"Amber"
		elsif states.include?("Green")
			"Green"
		end
  end
  
  private
  
  def save_team
    
    @team = Team.find(team_id)
    if @team
      @team.save
    end
  end
  
  def calculate_status()
    #self.status = get_status(id)
    self.status = params[:id]
  end

  def self.find_with_options(status = nil)

    eval(Employee.return_search(status))
  end
  
  def self.return_search(status)
    
    search_string = "Employee.find :all, :order => 'name'"

    if status != "All" and status != ""
      search_string = search_string + ", :conditions => \"status = '#{status}'\""
    end
    return search_string
  end
end