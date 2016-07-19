require('spec_helper')

describe(List) do

  it("validates presence of description") do
    list = List.new({:name => ""})
    expect(list.save()).to(eq(false))
  end

  it("ensures the length of task name is at most 20 characters") do
    list = List.new({:name => "a".*(21)})
    expect(list.save()).to(eq(false))
  end

  # it('converts the list name to lowercase') do
  #   list = List.create({:name => "BINDING.PRY"})
  #   expect(list.description()).to(eq("binding.pry"))
  # end

  describe('#tasks') do
    it('tells which tasks are in it') do
      test_list = List.create({:name => "list"})
      test_task1 = Task.create({:description => "task 1", :list_id => test_list.id})
      test_task2 = Task.create({:description => "task 2", :list_id => test_list.id})
      expect(test_list.tasks()).to(eq([test_task1, test_task2]))
    end
  end


end
