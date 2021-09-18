class Users::QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "質問を投稿しました"
      redirect_to question_path(@question.id)
    else
      @question = Question.all
      render :index
    end
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
    @answer = Answer.new
  end

  def index
    @questions = Question.page(params[:page]).reverse_order
  end

  def edit
    @question = Question.find(params[:id])
    if @question.user_id == current_user.id
      render :edit
    else
      redirect_to questions_path
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "質問内容を編集しました"
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :title, :body, :image)
  end

end
