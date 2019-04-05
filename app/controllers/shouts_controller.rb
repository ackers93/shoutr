class ShoutsController < ApplicationController
  def create
  shout = current_user.shouts.create(shout_params)
    redirect_to root_path, redirects_options_for(shout)
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end

  def redirects_options_for(shout)
    if shout.persisted?
    { notice: "Shouted succesfully!" }
  else
    {alert: "Could not shout."}
  end
end
end
