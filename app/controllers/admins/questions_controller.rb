class Admins::QuestionsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @questions = Question.page(params[:page]).per(10).reverse_order
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:alert] = "質問を削除しました。"
    redirect_to admins_questions_path
  end
end
