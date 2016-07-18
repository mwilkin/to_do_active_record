require('sinatra/activerecord')
class List < ActiveRecord::Base
  has_many(:tasks)
end
