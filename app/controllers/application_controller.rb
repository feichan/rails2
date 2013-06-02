# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  require "will_paginate"
  attr_accessor :auth_list
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # add filter to ask user to login
  before_filter :login?, :auth_list

  def login?
  	if session[:member_id].nil?
      redirect_to root_path
    end
  end

  def auth_list
    @auth_list = {1 => "管理员", 2 => "教务处", 3 => "实验中心", 4 => "学院", 5 => "医院"}
  end

end
