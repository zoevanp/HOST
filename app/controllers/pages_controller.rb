class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @user_profile = current_user
  end

  def error_page
    @user = current_user
  end
end
