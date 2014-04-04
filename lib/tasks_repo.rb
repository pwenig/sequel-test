require 'sequel'
class TasksRepo

  def initialize(db)
    @tasks_table = db[:tasks]
  end

  def create(attributes)
    @tasks_table.insert(attributes)
  end

  def find(id)
    @tasks_table.where(:id => 1).to_a
  end

  def all
    @tasks_table.to_a
  end

end