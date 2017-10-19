# rubocop:disable all

  class BotProfile
    def self.enable(access_token)
      # Set call to action button when user is about to address bot
      # for the first time. Handle the payload in postbacks
      
      @basicbot = Basicbot.find_by_access_token(access_token)
      
        Facebook::Messenger::Profile.set({
          get_started: {
            payload: 'START'
          }
          }, access_token: access_token)

      # NOTE: You can user {{user_last_name}} or {{user_full_name}} to
      # personalize greeting.
      Facebook::Messenger::Profile.set({
        greeting: [
          {
            locale: 'default',
            text: @basicbot.welcome_greeting
          }
        ]
      }, access_token: access_token)
    end
  end

