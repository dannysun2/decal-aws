class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_counts
  protect_from_forgery with: :exception
  include Counts
  before_action :authenticate_user!

  def set_counts
    order_counts
  end

end
