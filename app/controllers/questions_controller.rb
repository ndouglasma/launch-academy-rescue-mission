class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc).all
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
    # @answers = @question.answers.order(created_at: :desc)
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  # POST /question
  def create
    @question = Question.new(question_params)
    @question.user_id=1

    if @question.save
      flash[:success] = "Your new question #{@question.title} was saved successfully."
      redirect_to question_path(@question)
    else
      flash[:error] = "Your new question was not saved due to errors."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    # binding.pry
    if @question.update(question_params)
      flash[:success] = "Your update to question #{@question.title} was saved successfully."
      redirect_to question_path(@question)
    else
      flash[:error] = "Your question update was not saved due to errors."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = "Your question was deleted successfully."
      redirect_to questions_path
    else
      flash[:error] = "Your question was not deleted successfuly due to errors."
      render :index
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
