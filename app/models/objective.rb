class Objective < ActiveRecord::Base
  belongs_to :plan
  belongs_to :program
  attr_accessible :title, :cost, :value, :program_id, :plan_id, :position
  acts_as_list scope: :program
  def ratio
    (value * 100 / cost)
  end
end