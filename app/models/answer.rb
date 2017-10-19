class Answer < ActiveRecord::Base
  belongs_to :basicbot
  has_many :postbacks
end
