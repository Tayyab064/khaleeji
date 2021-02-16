class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def restrict_user
    restrict_access_to_user || render_unauthorized
  end

  def restrict_access_to_user
    authenticate_or_request_with_http_token do |token, _options|
      if User.exists?(token: token) && (user = User.find_by_token(token))
        if user.role == 'end_user'
          @current_user = user
        end
      end
    end
  end

  def is_enduser
    if session[:user].present?
      unless u = User.where(role: 0).find_by_email(session[:user])
        if  u.block == false
         redirect_to '/' , notice: 'Error: Dont have access'
        else
          redirect_to '/' , notice: 'Error: Kindly Signin first'
        end
      end
      @end_user = u
    else
      redirect_to '/' , notice: 'Error: Kindly Signin first'
    end
  end

  def is_enduser_check
    if session[:user].present?
      unless u = User.where(role: 0).find_by_email(session[:user])
        if  u.block == false
         redirect_to '/' , notice: 'Error: Dont have access'
        else
          redirect_to '/' , notice: 'Error: Kindly Signin first'
        end
      end
      @end_user = u
    end
  end

end
