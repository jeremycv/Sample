class Skill < ActiveRecord::Base
  
  include ApplicationHelper
  
  VALID_COMPLEXITY = %w(High Medium Low)
  
  before_save :calculate_status unless @skill.nil?
  
  belongs_to :team
  has_many :enrollments
  has_many :employees, :through => :enrollments
  
  validates_presence_of :name, :message => " - Each skill should be identified by name."
  validates_presence_of :complexity, :message => " - Each skill requires a specified complexity of either High, Medium or Low"
  validates_presence_of :red_threshold, :message => " - The Red threshold should be a value from 1 -> 100"
  validates_presence_of :amber_threshold, :message => " - The Amber threshold should be a value from 1 -> 100"
  validates_presence_of :number_people_required, :message => " - Specify the number of people required to complete this task"
  
  def self.get_skill()

    eval(Skill.return_skill_search())
  end
  
  def self.return_skill_search()
   
     return "Skill.find :all, :order => 'name'"
  end
    
  def get_currency(skill_id = nil)
    
    Enrollment.find(:all, :select => "sum(currency) as total, count(*) as count", :conditions => {:skill_id => "#{skill_id}", :reportable => true}).map {|c| c.count > 0 ? c.total/c.count : 0 }.to_s.to_f
  end
  
  def get_availability(skill_id = nil)
    
    Enrollment.find(:all, :select => "count(*) as total", :conditions => {:skill_id => "#{1}", :reportable => true}).map {|c| c.total}.to_s.to_i
    
  end
  
  def calculate_status(skill_id = nil)

    currency = get_currency(self.id)
    
    red_threshold = self.red_threshold
    red_threshold = red_threshold ? red_threshold : 70
    
    amber_threshold = self.amber_threshold
    amber_threshold = amber_threshold ? amber_threshold : 90
    
    is_skilled = (get_availability(self.id) - self.number_people_required) >= 0 ? true : false
    
    status = "Red" if currency < red_threshold or !(is_skilled)
    status = "Amber" if (currency > red_threshold) and is_skilled
    status = "Green" if (currency > amber_threshold) and is_skilled
    
    self.status = status
    
  end
  
  def self.find_with_options(status = nil)

    eval(Skill.return_search(status))
  end
  
  def self.return_search(status)
    
    search_string = "Skill.find :all, :order => 'name'"

    if status != "All" and status != ""
      search_string = search_string + ", :conditions => \"status = '#{status}'\""
    end
    return search_string
  end
end
