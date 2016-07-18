require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    fill_in('name', :with => 'Epicodus Work')
    click_button('Add New List')
    expect(page).to have_content('Success')
  end
end

describe('viewing all of the lists', {:type => :feature}) do
  it('allows a user to see all of the lists that have been created') do
    visit('/')
    fill_in('name', :with => 'Epicodus Work')
    click_button('Add New List')
    click_link('Return Home')
    expect(page).to have_content('Epicodus Work')
  end
end

describe('seeing details for a single list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    fill_in('name', :with => 'Epicodus Work')
    click_button('Add New List')
    click_link('Return Home')
    click_link('Epicodus Work')
    expect(page).to have_content('Add a task to Epicodus Work')
  end
end

describe('adding tasks to a list', {:type => :feature}) do
  it('allows a user to add a task to a list') do
    test_list = List.new({:name => 'School stuff', :id => nil})
    test_list.save()
    visit("/lists/#{test_list.id()}")
    fill_in("Description", {:with => "Learn SQL"})
    fill_in("due-date", {:with => '2016-08-01'})
    click_button("Add task")
    expect(page).to have_content("Success")
  end
end
