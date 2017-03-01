require_relative 'employee'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require 'bundler/setup'
require "active_record"
require 'pry'
require_relative 'db_connection'

class EmployeeTest < Minitest::Test

# Employee.new(name: "Robby Dore",
#               email_address: "Rdore88@gmail.com",
#               phone_number: "404-277-3952",
#               salary: 60000
#             ).save

  def test_employee_exists
    assert Employee
  end

  def test_employee
    assert_equal "Robby Dore", Employee.first.name
  end

  def test_change_salary
    skip
    Employee.first.change_salary(5000)
    assert_equal 65000, Employee.first.salary
  end

  def test_leave_review
    Employee.first.leave_review("Robby is a great worker")
    assert_equal "Robby is a great worker", Employee.first.review
  end


end
