class Objective < ActiveRecord::Base
  belongs_to :plan
  belongs_to :program
  attr_accessible :title, :cost, :value, :program_id, :plan_id, :position, :description
  validates :title, presence: :true
  validates :cost, presence: :true
  validates :value, presence: :true
  validates_numericality_of :cost, :only_integer => true, :message => "Can only be whole number."
  validates_numericality_of :value, :only_integer => true, :message => "Can only be whole number."
  acts_as_list scope: :program
  def ratio
    (value * 100 / cost)
  end
end