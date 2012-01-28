class Enrollment < ActiveRecord::Base
  
  include ApplicationHelper
  
  validates_presence_of :level, :message => " - An appropriate Skill Level of Expert, Intermediate or Beginner is required"
  validates_presence_of :skill_id, :message => "- A skill is required here"
  #validates_presence_of :last_performed, :message => " - A date this skill was last performed is required"
  
  before_save :additional_validation, :get_skill, :calculate_currency, :calculate_score, :calculate_status
  after_save  :save_employee
  
  belongs_to :employee
  belongs_to :skill
    
  private
  
  def save_employee
    
    @employee = Employee.find(employee_id)
    if @employee
      @employee.save
    end
  end
  
  def additional_validation
    
    if ((Date.today - last_performed) < 0)
       errors.add :last_performed, "Date last performed can not be a future date"
    end
  end
  
  def get_skill
    
    @skill = Skill.find(skill_id)
  end
  
  def calculate_currency
    
    decay_rate_high = -0.026
    decay_rate_medium = -0.015
    
    # find the complexity of this skill (i.e. High, Medium or Low)
    complexity = @skill.complexity
    
    # if date last performed is in the future reset it to today
    if (Date.today - last_performed) < 0
       self.last_performed = Date.today
    end
    
    # if last_performed is unavailable use a default date of today
    date_last_performed = last_performed ? last_performed : Date.today
    
    num_weeks = ((Date.today - date_last_performed)/7).to_i
    decay_rate_low = -num_weeks/5000.0
    
    kFactor = case @skill.complexity
      when "Low" 
        decay_rate_low
      when "Medium" 
        decay_rate_medium
      when "High" 
        decay_rate_high
      else 
        -1
    end
    self.currency = 100 * (Math.exp(kFactor * num_weeks))
  end
  
  def calculate_score
    
    self.score = currency * level
  end
  
  def calculate_status
    
    red_threshold = @skill.red_threshold
    red_threshold = red_threshold ? red_threshold : 70
    
    amber_threshold = @skill.amber_threshold
    amber_threshold = amber_threshold ? amber_threshold : 90
    
    status = "Amber"
    status = "Green" if currency > amber_threshold.to_f
    #status = "Red" if currency <= red_threshold.to_f
    self.status = status
  end
  
end
