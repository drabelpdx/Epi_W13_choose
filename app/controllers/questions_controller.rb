class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create!(question_params)
    if @question.save
      # current_user.question.push(@question)
      flash[:notice] = "Your question has been posted."
      redirect_to questions_path()
    else
      render :new
    end
end

  private

  def question_params
    params.require(:question).permit(:option_a, :option_b)
  end
end
