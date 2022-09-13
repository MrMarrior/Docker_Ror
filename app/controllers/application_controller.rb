class ApplicationController < ActionController::Base
  helper_method :current_user
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] # =|| конструкция работает по принципу посмотрим, что слева если там null выполни то, что справа и запиши результат в левую часть

  end

end
