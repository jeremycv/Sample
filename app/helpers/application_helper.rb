# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def colour(status = nil)
    
    color = case status
      
    when "Red"
      "Red"
    when "Amber"
		  "Orange"
		when "Green"
		  "Green"
	  else
	    "Black"
	  end
  end
end
