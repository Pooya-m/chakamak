require 'sitemap_pinger'

class Poem < ActiveRecord::Base
  #call_backs:
  before_create :create_poet
  before_update :create_poet

  belongs_to :poet
  belongs_to :user

  validates_presence_of :content
  validates_presence_of :poet_name
  validates_length_of :content, maximum: 102

  has_many :votes , dependent: :destroy

  def create_poet
    @poet = Poet.find_or_initialize_by_poet_name(self.poet_name)
    @poet.save!
    self.poet_id = @poet.id
  end

  def ping
    SitemapPinger.ping
  end

end
