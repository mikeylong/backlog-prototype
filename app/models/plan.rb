class Plan < ActiveRecord::Base
  attr_accessible :title, :program_id
  
  belongs_to :program
  has_many :objectives
  has_many :projects
end
