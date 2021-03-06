class PostbacksController < ApplicationController
  
  def create
    params[:postback][:multiple_options] = params[:postback][:multiple_options].reject(&:empty?).map {|i| [] << i << i + Random.rand(1000).to_s}
    @basicbot = Basicbot.find(params[:basicbot_id])
    @postbacks = @basicbot.postbacks.where(payload: params[:postback][:payload]).first_or_initialize
    @postbacks.reply = params[:postback][:reply]
    @postbacks.multiple_answers = params[:postback][:multiple_answers]
    @postbacks.answer_id = params[:postback][:answer_id]
    @postbacks.multiple_options = params[:postback][:multiple_options]
    if params[:postback][:image] == ""
      @postbacks.image = nil
    else  
      @postbacks.image = params[:postback][:image]
    end
    @postbacks.save
    redirect_to basicbot_url(params[:basicbot_id]) + "#5a"
  end
  
  private
  
  def postback_params
    params.require(:postback).permit(:reply, :multiple_answers, :payload, :answer_id).tap do |whitelisted|
      whitelisted[:multiple_options] = params[:postback][:multiple_options]
    end
  end
  
  
end