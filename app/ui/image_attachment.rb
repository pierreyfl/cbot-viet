# rubocop:disable Metrics/MethodLength
module UI
  # https://developers.facebook.com/docs/messenger-platform/send-api-reference/image-attachment
  class ImageAttachment
    def initialize(url)
      @template = {
        recipient: {
          id: nil
        },
        message: {
          attachment: {
            type: 'image',
            payload: {
              url: url
            }
          }
        }
      }
    end

    def send(user, at)
      formed = build(user)
      Bot.deliver(formed, access_token: at)
    end

    def build(user)
      @template[:recipient][:id] = user.id
      @template
    end
  end
end
