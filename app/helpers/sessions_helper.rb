module SessionsHelper
  
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

 # ユーザーがログインしていればtrue、その他ならfalseを返す
 def logged_in?
  !current_user.nil?
 end

end
