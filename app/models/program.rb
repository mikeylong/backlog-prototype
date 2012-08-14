class Program < ActiveRecord::Base
  attr_accessible :title
  
  has_one :plan
  has_many :projects, through: :plan
  has_many :objectives, order: 'position'
end
