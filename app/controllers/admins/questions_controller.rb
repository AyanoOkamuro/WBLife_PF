class Admins::QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page]).reverse_order
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admins_questions_path
  end
end
