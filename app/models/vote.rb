class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :poem , counter_cache: true
end
