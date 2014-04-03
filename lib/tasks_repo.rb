require 'sequel'
class TasksRepo

  def initialize(db)
    @db = db
  end

  def insert(task)
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    tasks = db[:tasks]
    tasks.insert(task)
  end

  def select_all
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    tasks = db[:tasks]
    tasks.to_a
  end
end