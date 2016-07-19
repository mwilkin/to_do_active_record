require('sinatra/activerecord')
class Task < ActiveRecord::Base
  belongs_to(:list)
  scope(:not_done, -> do
    where({:done => false})
  end)
  validates(:description, {:presence => true, :length => { :maximum => 50 }})
  validates :description, exclusion: { in: %w(kill maim murder frottage), message: "no %{value} is vorbotten! behave yourself!" }
end
