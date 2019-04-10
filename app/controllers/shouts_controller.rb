class ShoutsController < ApplicationController
  def show
    @shout = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.create(content: content_from_params)
    redirect_to root_path, redirects_options_for(shout)
  end

  private

  def content_from_params
    case params[:shout][:content_type]
    when "TextShout"
      shout = TextShout.new(text_shout_content_params)
    when "PhotoShout"
      shout = PhotoShout.new(photo_shout_content_params)
      shout.image.attach(photo_shout_content_params[:image])
    end
    unless shout.save
      raise 'shout was not able to save. that is not expected.'
    end
    shout
 end

  def text_shout_content_params
    params.require(:shout).require(:content).permit(:body)
  end

  def photo_shout_content_params
    params.require(:shout).require(:content).permit(:image)
  end

  def redirects_options_for(shout)
    if shout.persisted?
    { notice: "Shouted successfully!" }
    else
      {alert: "Could not shout."}
    end
  end
end
