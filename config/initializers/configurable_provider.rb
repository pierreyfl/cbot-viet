class ExampleProvider < Facebook::Messenger::Configuration::Providers::Base
  # Verify that the given verify token is valid.
  #
  # verify_token - A String describing the application's verify token.
  #
  # Returns a Boolean representing whether the verify token is valid.
  def valid_verify_token?(verify_token)
    ENV['VERIFY_TOKEN']
  end

  # Find the right application secret.
  #
  # page_id - An Integer describing a Facebook Page ID.
  #
  # Returns a String describing the application secret.
  def app_secret_for(page_id)
    ENV['APP_SECRET']
  end

  # Find the right access token.
  #
  # recipient - A Hash describing the `recipient` attribute of the message coming
  #             from Facebook.
  #
  # Note: The naming of "recipient" can throw you off, but think of it from the
  # perspective of the message: The "recipient" is the page that receives the
  # message.
  #
  # Returns a String describing an access token.
  def access_token_for(recipient)
    Basicbot.find_by(page_id: recipient['id']).access_token
    puts "HAHAAHA"
  end

  private

  def bot
    Rails4Boilerplate::Basicbot
  end
end

Facebook::Messenger.configure do |config|
  config.provider = ExampleProvider.new
  puts "WOOOOOW"
end