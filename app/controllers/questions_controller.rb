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

  def show
    @questions = Question.all
    @question = Question.find(params[:id])
  end

def upvote
  @question = Question.find params[:id]
  current_user.upvote(@question)
  flash[:message] = 'Thanks for voting!'
  redirect_to questions_path()
rescue MakeVoteable::Exceptions::AlreadyVotedError
  flash[:error] = 'Already voted!'
  redirect_to questions_path()
end

def downvote
  @question = Question.find params[:id]
  current_user.downvote(@question)
  flash[:message] = 'Thanks for voting!'
  redirect_to question_path(@question)
rescue MakeVoteable::Exceptions::AlreadyVotedError
  flash[:error] = 'Already voted!'
  redirect_to question_path(@question)
end

  private

  def question_params
    params.require(:question).permit(:option_a, :option_b)
  end
end
