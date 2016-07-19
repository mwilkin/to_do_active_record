require('sinatra/activerecord')
class List < ActiveRecord::Base
  has_many(:tasks)
  validates(:name, {:uniqueness => true, :presence => true, :length => { :maximum => 20 }})
#   before_save(:downcase_name)
#
# private
#   define_method(:downcase_name) do
#     self.description = (name().downcase())
#   end
end
