class Objective < ActiveRecord::Base
  belongs_to :plan
  belongs_to :program
  attr_accessible :title, :program_id, :plan_id
end
