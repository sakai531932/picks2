class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    index2_page_path
  end
end
