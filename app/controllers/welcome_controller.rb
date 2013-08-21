class WelcomeController < ApplicationController
#  require 'will_paginate/array'

  def index
  end

  def profile_show
    @user = User.friendly.find(params[:id])
    @poems = c_paginate(@user.poems.order('created_at DESC'))
    @upvotes = @user.votes.order('created_at DESC').collect { |u| u.poem }
    @upvotes = c_paginate(Kaminari.paginate_array(@upvotes),params[:votes])
  end

  def faq
  end

  def sitemap
    @users = User.all
    @poems = Poem.all
  end

end

