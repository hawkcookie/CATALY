class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


protect_from_forgery with: :null_session




  # ログイン済ユーザーのみにアクセスを許可する
before_action :authenticate_user!, only: [:/]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:uni, :sex,:work,:image,:location,:annual,:club,:subject,:consalting,:free_profile ]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:uni, :sex,:work,:image,:location,:annual,:club,:subject,:consalting,:free_profile])
  end


    def after_sign_in_path_for(resource)
      root_path # ログイン後に遷移するpathを設定
    end

    def after_sign_out_path_for(resource)
       root_path # ログアウト後に遷移するpathを設定
    end



end
