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
    expected_taks = [
      {:id => 1, :name => "Wash Laundry"},
      {:id => 2, :name => "Wash Dishes"}
    ]
    expect(repo.all).to eq expected_taks
  end


  end
