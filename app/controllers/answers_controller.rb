class AnswersController < ApplicationController
  
  def new
    @answers = Answer.new
  end
  
  def create
    params[:answer][:question] = params[:answer][:question].reject(&:empty?)
    params[:answer][:multiple_options] = params[:answer][:multiple_options].reject(&:empty?).map {|i| [] << i << i + Random.rand(1000).to_s}
    if params[:answer][:image] == ""
      params[:answer][:image] = nil
    end
    @basicbot = Basicbot.find(params[:basicbot_id])
    @answers = @basicbot.answers.new(answer_params)
    @answers.save
    redirect_to basicbot_url(params[:basicbot_id]) + "#4a"
  end
  
  
  private
  
  def answer_params
    params.require(:answer).permit(:reply, :exact_keyword, :multiple_answers, :image, :question => []).tap do |whitelisted|
      whitelisted[:multiple_options] = params[:answer][:multiple_options]
    end

  end
  
end