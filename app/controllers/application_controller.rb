class ApplicationController < ActionController::Base
    # 最新のブラウザのみをサポートする設定
    allow_browser versions: :modern
    helper_method :current_user, :user_signed_in?

    private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def user_signed_in?
      current_user.present?
    end

    def authenticate_user!
      return if user_signed_in?

      redirect_to new_user_session_path, alert: "ログインが必要です。"
    end
end
