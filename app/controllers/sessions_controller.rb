class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "ログインが完了しました！"
    else
      @error_message = "メールアドレスまたはパスワードが無効です。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトが完了しました！"
  end
end
