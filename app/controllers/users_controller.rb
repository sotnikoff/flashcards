class UsersController < ApplicationController
  def update
    notice = if current_user.update(user_params)
               t('.success')
             else
               t('.failure')
             end
    redirect_to root_path, notice: notice
  end

  private

  def user_params
    params.require(:user).permit(:deck_id)
  end
end
