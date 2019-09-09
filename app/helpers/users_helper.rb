module UsersHelper
  # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user, option = {size: 200} )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    image_size = option[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{image_size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
