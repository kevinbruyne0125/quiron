class Api::QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render json: @questions
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: @question
    else 
      render json: { errors: { message: "This question failed to save" } }
    end
  end

  def destroy
    binding.pry
      @question = question.find_by(id: params[:questionid])
    if @question.destroy
      render status: 204
    else
      render json: { message: "Unable to remove this post" }, status: 400
    end  
  end 

private
  def question_params
    params.require(:question).permit(:title, :details)
  end

end 