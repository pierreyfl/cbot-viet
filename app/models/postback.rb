class Postback < ActiveRecord::Base
  belongs_to :answer
  belongs_to :basicbot
end
