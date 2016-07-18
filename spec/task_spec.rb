require('spec_helper')

describe(Task) do

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-06-15'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#description") do
    it("lets you read the description out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-06-15'})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-06-15'})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-06-15'})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-06-15'})
      expect(task1).to(eq(task2))
    end
  end

  describe(".all") do
    it("returns an array of tasks sorted by their due date") do
      test_task_one = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-06-15'})
      test_task_two = Task.new({:description => "learn Ruby", :list_id => 2, :due_date => '2016-06-12'})
      test_task_one.save()
      test_task_two.save()
      expect(Task.all()).to(eq([test_task_two, test_task_one]))
    end
  end

end
