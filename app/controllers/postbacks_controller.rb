class PostbacksController < ApplicationController
  
  def create
    params[:postback][:multiple_options] = params[:postback][:multiple_options].reject(&:empty?).map {|i| [] << i << i + Random.rand(1000).to_s}
    @basicbot = Basicbot.find(params[:basicbot_id])
    @postbacks = @basicbot.postbacks.new(postback_params)
    @postbacks.save
    redirect_to root_path
  end
  
  private
  
  def postback_params
    params.require(:postback).permit(:reply, :multiple_answers, :payload, :answer_id).tap do |whitelisted|
      whitelisted[:multiple_options] = params[:postback][:multiple_options]
    end
  end
  
  
end