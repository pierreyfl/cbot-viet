require "facebook/messenger"
require_relative '../rubotnik/rubotnik'
require_relative '../helpers/helpers'
include Helpers
include Facebook::Messenger

# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'
#Facebook::Messenger::Subscriptions.subscribe(access_token: ENV['ACCESS_TOKEN'])
#Rubotnik::BotProfile.enable

Bot.on :message do |message|
  message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  message.sender      # => { 'id' => '1008372609250235' }
  message.seq         # => 73
  message.sent_at     # => 2016-04-22 21:30:36 +0200
  message.text        # => 'Hello, bot!'
  message.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]

  #message.reply(text: Basicbot.find_by_page_id(message.recipient['id']).message_text)
  @basicbot = Basicbot.find_by_page_id(message.recipient['id'])
  @access_token = @basicbot.access_token
  Chat.create(message: message.text, sender_id: message.sender['id'], sent_at: message.sent_at)

    
  Rubotnik::MessageDispatch.new(message).route do
     # All strings will be turned into case insensitive regular expressions.
     # If you pass a number of strings, any match will trigger a command,
     # unless 'all: true' flag is present. In that case, MessageDispatch
     # will expect all words to be present in a single message.

     # Use with 'to:' syntax to bind to a command found inside Commands
     # or its sub-modules.
     puts @user
     puts "HAHAHHAAHWAHAHA"
     unless @answers.nil?
       @answers.each do |a|
         bind_array a.question, all: a.exact_keyword do
           if a.multiple_answers
             unless a.image.nil?
               img_url = a.image
               UI::ImageAttachment.new(img_url).send(message.recipient, @access_token)
             end
             replies = UI::QuickReplies.build(a.multiple_options)
             say a.reply, quick_replies: replies 
           else
             unless a.image.nil?
               img_url = a.image
               UI::ImageAttachment.new(img_url).send(message.recipient, @access_token)
             end
             say a.reply
           end
         end
        end
      end
      
     unless message.quick_reply.nil?
       @basicbot2 = Basicbot.find_by_page_id(message.recipient['id'])
       @basicbot2.postbacks.each do |i|
         if message.quick_reply == i.payload
           if i.multiple_answers
             unless i.image.nil?
               img_url = i.image
               UI::ImageAttachment.new(img_url).send(message.sender, @access_token)
             end
             replies = UI::QuickReplies.build(i.multiple_options)
             say i.reply, quick_replies: replies
             puts "HAHAHAHAHAHA"
             puts @user
           else
             unless i.image.nil?
               img_url = i.image
               UI::ImageAttachment.new(img_url).send(message.sender, @access_token)
             end
             say i.reply
           end
         end
       end
     end
     
     
     bind 'carousel', 'generic template', to: :show_carousel
     #bind 'button', 'template', all: true, to: :show_button_template
     bind 'image', to: :send_image

     
      

     # bind also takes regexps directly
     bind(/my name/i, /mon nom/i) do
       user_info = get_user_info(:first_name)
       if user_info
         user_name = user_info[:first_name]
         say "Your name is #{user_name}!"
       else
         say 'I could not get your name, sorry :('
       end
     end

     # Use with block if you want to provide response behaviour
     # directly without looking for an existing command inside Commands.
     bind 'knock' do
       say "Who's there?"
     end

     bind 'hi', 'hello', 'yo', 'hey' do
       say "Nice to meet you! Here's what I can do"
     end
     bind '3333', 'hello111', 'yo111', 'hey1111' do
       say "Nice to meet you! Here's what I can do!!!"
     end
   end
  
  #Chat.create(message: message.text)
  BotProfile.enable(@access_token)
end

Bot.on :postback do |postback|
  puts postback
  puts "HUHUHU"
  Rubotnik::PostbackDispatch.new(postback).route do
    
    puts postback
    puts "WEEEKKAKA"
    @basicbot = Basicbot.find_by_page_id(postback.recipient["id"])
    @access_token = @basicbot.access_token
    
    @basicbot.postbacks.each do |i|
      bind i.payload do
        
        say i.reply
        if multiple_answers
          replies = UI::QuickReplies.build(i.multiple_options)
          say i.reply, quick_replies: replies
        end
      end
    end
    
    bind 'START' do
      say @basicbot.greeting
      #replies = UI::QuickReplies.build(['Yes', 'YES'], ['No', 'NO'], ['Maybe', 'Maybe'])
      #say 'Welcome to the sample questionnaire! Are you ready?', quick_replies: replies
      #say 'Here are some suggestions for you:'
    end
  end
end
#Bot.on :postback do |postback|
  #Rubotnik::PostbackDispatch.new(postback).route do
    #bind 'START' do
      #say 'First time, huh? Hello and welcome!'
      #say 'Here are some suggestions for you:'
      #end
  #end
  #end
Bot.on :message_echo do |message_echo|
  #message_echo.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  #message_echo.sender      # => { 'id' => '1008372609250235' }
  #message_echo.seq         # => 73
  #message_echo.sent_at     # => 2016-04-22 21:30:36 +0200
  #message_echo.text        # => 'Hello, bot!'
  #message_echo.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]

  #puts message_echo.text # Log or store in your storage method of choice (skynet, obviously)
  #puts "TEST MESSAGE ECHO"
end



