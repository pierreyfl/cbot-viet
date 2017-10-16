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
  end

  


    private
    
    def basicbot_params
      params.require(:basicbot).permit(:name)
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