module ShoutHelper
  def avatar(user)
  image_tag "https://picsum.photos/60/60/?random(shout.user.email)}"
end
end
