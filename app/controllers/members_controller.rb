class MembersController < ApplicationController

  def index
    # のちのち使うかも？
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :email, :password, :password_confirmation)
  end
end
