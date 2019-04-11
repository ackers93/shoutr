module ShoutHelper
  def avatar(user)
  image_tag "https://picsum.photos/60/60/?random(shout.user.email)}"
end

  def like_button(shout)
    if current_user.liked?(shout)
      link_to "Unlike", unlike_shout_path(shout), method: :delete
    else
      link_to "Like", like_shout_path(shout), method: :post
    end
  end
end
