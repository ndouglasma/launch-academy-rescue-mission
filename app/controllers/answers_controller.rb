class AnswersController < ApplicationController
  # def index
  #   @question = Question.find(params[:question_id])
  #   @answers = @question.answers.order("created_at DESC")
  # end

  def new
    @answer = Answer.new
  end

  # POST /questions/:question_id/answers
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user_id= @question.user_id
    @answer.question = @question
    @answer.best_answer=false
    if @answer.save
      flash[:success] = "Your new answer was saved successfully."
      redirect_to question_path(@question)
    else
      flash[:error] = "Your new answer was not saved due to errors."
      render 'questions/show'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:detail)
  end
end
