class PagesController < ApplicationController
  def index
  end
  
  def index2
    @profile = Profile.find_by(user_id: current_user.id)
  end
  
  def done
  end
  
end
