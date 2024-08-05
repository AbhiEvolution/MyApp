class StaticPagesController < ApplicationController
  # before_action :authenticate_user!
  def home
    @posts = Post.published
  end
end
