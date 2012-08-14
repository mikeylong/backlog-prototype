class Plan < ActiveRecord::Base
  attr_accessible :title, :program_id
  
  has_many :objectives
  has_many :projects
end
