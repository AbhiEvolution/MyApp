class ApplicationController < ActionController::Base
  include Authentication
  def home
    if user_signed_in?
      redirect_to posts_path
    else
      redirect_to static_pages_home_path
    end
  end
end
