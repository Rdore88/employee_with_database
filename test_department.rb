require_relative 'department'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require 'bundler/setup'
require "active_record"
require_relative 'employee'
require 'pry'
require_relative 'db_connection'

class DepartmentTest < Minitest::Test


  # Department.new(name: "Software").save

  def test_employee_exists
    assert Department
  end

  def test_department_name
    assert_equal "Software", Department.first.name
  end

  def test_adding_employee
    Department.first.add_employee(Employee.first)
    assert_equal Department.first.id,Employee.first.department_id
  end

  def test_total_department_payroll
    skip
    assert_equal 65000, Department.first.total_department_payroll(Employee.all)

  end

end
