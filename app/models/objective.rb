class Objective < ActiveRecord::Base
  belongs_to :plan
  belongs_to :program
  attr_accessible :title
end
