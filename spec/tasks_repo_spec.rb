require 'spec_helper'
require 'tasks_repo'

describe TasksRepo do

  let(:db) { Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test') }
  before do
    db.create_table :tasks do
      primary_key :id
      String :name
    end
  end

  after do
    db.drop_table :tasks
  end

  it "allows for creating a task" do
     repo = TasksRepo.new(db)
    repo.create({:name => "Wash Laundry"})
    repo.create({:name => "Wash Dishes"})
    expected_tasks = [
      {:id => 1, :name => "Wash Laundry"},
      {:id => 2, :name => "Wash Dishes"}
    ]
    expect(repo.all).to eq expected_tasks
  end

  it "allows for finding a task by id" do
    repo = TasksRepo.new(db)
    repo.create({:name => "Wash Laundry"})
    repo.create({:name => "Wash Dishes"})
    expected_tasks = [
      {:id => 1, :name => "Wash Laundry"},
    ]
    expect(repo.find(1)).to eq expected_tasks
  end

  it "allows for deleting a task" do
    repo = TasksRepo.new(db)
    repo.create({:name => "Wash Laundry"})
    repo.create({:name => "Wash Dishes"})
    repo.delete(1)
    expected_tasks = [
      {:id => 2, :name => "Wash Dishes"},
    ]
    expect(repo.all).to eq expected_tasks
  end
  end
