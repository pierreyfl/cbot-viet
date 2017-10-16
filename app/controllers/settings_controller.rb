class SettingsController < ApplicationController
  layout :resolve_layout #Before rendering check which layout we should show

  # After login go here
  def index
    @graph = Koala::Facebook::API.new(session[:fb_access_token])
    profile = @graph.get_object("me")
    puts profile
  end



  private
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