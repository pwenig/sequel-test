require 'tasks_repo'

describe TasksRepo do
  it "can create a task repository" do
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    tasks = TasksRepo.new(db)
    db.create_table! :tasks do
      primary_key :id
      String :name
    end
    tasks.insert({:name => 'foo'})
    tasks.insert({:name => 'bar'})
    expect(tasks.select_all).to eq([{:id => 1, :name => 'foo'}, {:id => 2, :name => 'bar'}])
  end
end