class Poet < ActiveRecord::Base

  validates_presence_of :poet_name
  validates_uniqueness_of :poet_name

  has_many :poems
end
