require('sinatra/activerecord')
class List < ActiveRecord::Base
  has_many(:tasks)
  validates(:name, {:uniqueness => true, :presence => true, :length => { :maximum => 20 }})

end
