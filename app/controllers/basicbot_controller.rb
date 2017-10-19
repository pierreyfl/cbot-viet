class BasicbotController < ApplicationController
  layout "dashboard" #Before rendering check which layout we should show


  # After login go here
  def index

  end
  
  def new
    @basicbot = Basicbot.new
  end
  
  def create
    @basicbot = Basicbot.new(basicbot_params)
 
    @basicbot.save
    redirect_to users_path
  end
  
  def show
    @basicbot = Basicbot.find(params[:id])
    @answers = Answer.new
    @postbacks = Postback.new
    @pbacks = @basicbot.postbacks
  end
  
  def update
      @basicbot = Basicbot.find(params[:id])
      if @basicbot.update_attributes(basicbot_params)
          # if update is successful
          redirect_to basicbot_path(params[:id])
      else 
          # if update is unsuccessful
          redirect_to basicbot_index_path
      end
  end
  


    private
    
    def basicbot_params
      params.require(:basicbot).permit(:name, :access_token, :page_id, :welcome_greeting, :message_text, :greeting)
    end
    # Determine layout based on action name
    def resolve_layout
      case action_name
      when 'index'
        'dashboard'
      else
        'application'
      end
    end
end