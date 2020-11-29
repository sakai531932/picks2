class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    "https://1bdd6997d8c5412d893b1ed033f9347a.vfs.cloud9.us-east-2.amazonaws.com/profiles" 
  end
end
