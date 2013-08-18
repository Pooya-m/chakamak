 # -*- coding: utf-8 -*-

class ApplicationController < ActionController::Base
  Rack::MiniProfiler.authorize_request
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_score , :check_limit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html
  helper_method :has_limit?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_name, :email, :password) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
  end

  def clear(s)
    if s.length == 0
      return s
    end

    s.strip!
    s.squeeze!(" ")
    s.gsub! "\r",""
    if !s.include? "\n" and !s.include? "\r"
      s[(s.length / 2).floor] = s[(s.length / 2).floor] + "\n"
    end
    s.gsub! "\n", "            "
    s

  end

  def user_score(user)
    score = 0
    user.poems.each do |p|
      score += p.votes.count
    end
    score
  end

  def today_count
    poems = current_user.poems.where('DATE(created_at) = ?' , Time.now.utc.to_date)
    poems.count
  end

  def has_limit?
    if today_count >= 20
      true
    else
      false
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    poems_path
  end

  def after_sign_up_path_for(resource_or_scopre)
    poems_path
  end

  def better(string)
    string.gsub! 'ي' , 'ی' 
  end

  def p_array(array)
    Kaminari.paginate_array(array).page(params[:page]).per(15)
  end

end
