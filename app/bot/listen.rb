require "facebook/messenger"
include Facebook::Messenger

# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'
Bot.on :message do |message|
  message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  message.sender      # => { 'id' => '1008372609250235' }
  message.seq         # => 73
  message.sent_at     # => 2016-04-22 21:30:36 +0200
  message.text        # => 'Hello, bot!'
  message.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]

  message.reply(text: Basicbot.find_by_page_id(message.recipient['id']).message_text)
  @access_token = Basicbot.find_by_page_id(message.recipient['id']).access_token
  
  Chat.create(message: message.text)
  
  
  Facebook::Messenger::Profile.set({
    greeting: [
      {
        locale: 'default',
        text: "Hello"
      },
      {
        locale: 'fr_FR',
        text: 'Bienvenue dans le bot du Wagon !'
      }
    ],
    get_started: {
      payload: 'GET_STARTED_PAYLOAD'
    }
  }, access_token: @access_token)
  
end

Bot.on :message_echo do |message_echo|
  message_echo.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  message_echo.sender      # => { 'id' => '1008372609250235' }
  message_echo.seq         # => 73
  message_echo.sent_at     # => 2016-04-22 21:30:36 +0200
  message_echo.text        # => 'Hello, bot!'
  message_echo.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]

  puts message_echo.text # Log or store in your storage method of choice (skynet, obviously)
end



