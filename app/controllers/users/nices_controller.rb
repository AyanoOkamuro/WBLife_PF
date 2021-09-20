class Users::NicesController < ApplicationController

  def create
    @answer = Answer.find(params[:answer_id])
    nice = current_user.nices.new(answer_id: @answer.id)
    nice.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    nice = current_user.nices.find_by(answer_id: @answer.id)
    nice.destroy
    redirect_back(fallback_location: root_path)
  end

end
