class UsersController < ApplicationController
  before_filter :check_privileges!, only: [:index]
  def index
    @users = User.all
  end

end