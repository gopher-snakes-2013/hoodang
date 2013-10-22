class User < ActiveRecord::Base
  validates :name, presense: true
end