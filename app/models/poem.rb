class Poem < ActiveRecord::Base

  belongs_to :poet
  belongs_to :user

  validates_presence_of :content
  validates_presence_of :poet_name

end
