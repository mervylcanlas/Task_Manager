class HomeController < ApplicationController
  def index
    if (current_user.present?)
      @tasks = Task.where(user_id: current_user.id, deadline: Date.today)
    else
      redirect_to new_user_registration_path
    end
  end
end
