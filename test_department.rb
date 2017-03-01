require_relative 'department'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require 'bundler/setup'
require "active_record"
require 'pry'
require_relative 'db_connection_departments'

class DepartmentTest < Minitest::Test


  # Department.new(name: "Software").save

  def test_employee_exists
    assert Department
  end

  def test_department_name
    assert_equal "Software", Department.first.name
  end

end
