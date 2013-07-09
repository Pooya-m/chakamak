class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_score , :check_limit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_name, :email, :password) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
  end

  def clear(s)
    s.squeeze!(" ")
    if !s.include? "\n" and !s.include? "\r"
      s[(s.length / 2).floor] = s[(s.length / 2).floor] + "\n"
    end
    s.gsub! "\n", "            "
    s.gsub! "\r", "            "
  end

  def user_score(user)
    score = 0
    user.poems.each do |p|
      score += p.votes.count
    end
    score
  end

  def check_limit
    poems = current_user.poems :condition => ["DATE(created_at) = DATA(?)" , Time.now]
    if poems.count >= 30
          redirect_to poems_path , alert: t(:poem_limit)
    end

  end

  #def referer
  #  session[:return_to] ||= request.referer
  #end

end
