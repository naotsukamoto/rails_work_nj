class SelectController < ApplicationController
  def top
    # TeamMasterインスタンスの取得
    @teams = AllTeam.all
    # 新規ユーザーのインスタンスを定義
    @user = User.new
  end

  def index
    # ログインしていたら、別ページにリダイレクト
    if user_signed_in?
      redirect_to logs_top_path(login)
    end

  end

  def login
    @current_user = current_user.id
  end



  def create
    # 新規ユーザーのインスタンスの作成
    @user = User.new(user_params)
    if @user.save
      # インスタンス変数にユーザーを保存できたら、/logs/topに遷移
      render '/logs/top'
    else
      # 失敗したら、戻る
      render 'new'
    end
  end

  def user_params
    # ユーザーインスタンスの生成に必須であるパラメータを定義
    params.require(:user).permit(:login_id, :name, :email, :password, :favorite1)
  end

end
