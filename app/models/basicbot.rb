class Basicbot < ActiveRecord::Base
  has_many :answers
  has_many :postbacks
end
