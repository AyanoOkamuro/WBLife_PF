class Users::AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @user = @question.user
    @answer = current_user.answers.new(answer_params)
    @answer.question_id = @question.id
    @answer.save
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "編集しました。"
      redirect_to question_path(@question)
    else
      flash[:alert] = "回答を更新できませんでした。記載内容に謝りがある可能性がございます。"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @user = @question.user
    @answer = @question.answers.find(params[:id])
    @answer.destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :body, :image)
  end

end
