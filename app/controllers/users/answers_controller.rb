class Users::AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.new(answer_params)
    @answer.question_id = @question.id
    if @answer.save
      flash[:notice] = "回答しました。"
      redirect_to question_path(@question)
    else
      flash[:alert] = "回答できませんでした。記載内容に謝りがある可能性がございます。"
      redirect_to question_path(@question)
    end
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
      flash[:alert] = "編集できませんでした。記載内容に謝りがある可能性がございます。"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    flash[:notice] = "削除しました。"
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :body, :image)
  end

end
