# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication

  before_action :redirect_unsigned

  def redirect_unsigned
    redirect_to new_session_path unless user_signed_in?
  end
end
