require 'sequel'
class TasksRepo

  def initialize(db)
    @db = db
  end

  def insert(task)
    @db
    tasks = @db[:tasks]
    tasks.insert(task)
  end

  def select_all
    @db
    tasks = @db[:tasks]
    tasks.to_a
  end
end