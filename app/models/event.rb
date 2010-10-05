class Event < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :name, :description, :start_time, :end_time, :location, :user_id
  
  # Validations 
  validates_presence_of :name
  
  def to_param()
    "#{id}-#{name.parameterize}"
  end
end
