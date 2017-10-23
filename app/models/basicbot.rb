class Basicbot < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
  has_many :postbacks, :dependent => :destroy
end
