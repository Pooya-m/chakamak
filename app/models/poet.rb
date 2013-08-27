class Poet < ActiveRecord::Base

  validates_presence_of :poet_name
  validates_uniqueness_of :poet_name
  validates_length_of :poet_name, maximum: 15
  has_many :poems
end
