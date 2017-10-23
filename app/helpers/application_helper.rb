module ApplicationHelper
  
  def find_postback_reply(id)
      postback = Postback.find_by_payload(id)
      if postback
        postback.reply
      else
        "Please enter your response"
      end
  end
  
  def find_postback_image(id)
      postback = Postback.find_by_payload(id)
      if postback
        postback.image
      else
        "Place your image attachment link"
      end
  end

end
