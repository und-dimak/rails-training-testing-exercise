require "minitest/autorun"
require "minitest/pride"
require_relative "task"
require_relative "task_list"

class TaskListTest < Minitest::Test

  def setup
    @task_list = TaskList.new
    @c_task = Task.new("Learn C#")
    @ruby_task = Task.new("Learn Ruby")
  end

  def test_initialize
    assert_empty TaskList.new.all_tasks
  end
  
  def test_add_task
    @task_list.add_task(@c_task)
    assert_includes @task_list.all_tasks, @c_task
  end

  def test_remove_task
    @task_list.add_task(@ruby_task)
    @task_list.remove_task(@ruby_task.name)
    refute_includes @task_list.all_tasks, @ruby_task
  end

  def test_completed_tasks
    @task_list.add_task(@c_task)
    @task_list.add_task(@ruby_task)

    @c_task.complete!
    
    assert_includes @task_list.completed_tasks, @c_task
    refute_includes @task_list.completed_tasks, @ruby_task
  end

  def test_incomplete_tasks
    @task_list.add_task(@c_task)
    @task_list.add_task(@ruby_task)
    
    @c_task.complete!
    
    assert_includes @task_list.incomplete_tasks, @ruby_task
    refute_includes @task_list.incomplete_tasks, @c_task
  end

  def test_all_tasks
    @task_list.add_task(@c_task)
    @task_list.add_task(@ruby_task)
    
    assert_includes @task_list.all_tasks, @c_task
    assert_includes @task_list.all_tasks, @ruby_task
  end
end
