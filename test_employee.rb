require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require 'bundler/setup'
require "active_record"
require 'pry'
require_relative 'db_connection'
require_relative 'employee'
require_relative 'department'
require_relative 'database'
ActiveRecord::Migration.verbose = false

class EmployeeTest < Minitest::Test

  def setup
    CreateEmployeesTable.migrate(:up)
    CreateDepartmentsTable.migrate(:up)
  end

  def teardown
    CreateEmployeesTable.migrate(:down)
    CreateDepartmentsTable.migrate(:down)
  end


  def test_employee_exists
    assert Employee
  end


  def test_employee
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
      phone_number: "404-277-3952",salary: 60000)
    assert_equal "Robby Dore", robby.name
  end

  def test_change_salary
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
      phone_number: "404-277-3952",salary: 60000)
    robby.change_salary(5000)
    assert_equal 65000, robby.salary
  end

  def test_leave_review
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
      phone_number: "404-277-3952",salary: 60000)
    robby.leave_review("Robby is a great worker")
    assert_equal "Robby is a great worker", robby.review
  end

  def test_determine_if_satisfactory
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
      phone_number: "404-277-3952",salary: 60000)
    robby.leave_review("Robby is a great worker")
    robby.reload
    assert_equal "Satisfactory", robby.determine_if_satisfactory
  end

  def test_who_makes_more_than_average
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
    phone_number: "404-277-3952",salary: 60000)
    ford = Employee.create(name: "Harrison Ford", email_address: "Mr.Kickass@imbetter.com",
    phone_number: "234-562-4345", salary: 100000)
    assert_equal [ford], Employee.who_makes_more_than_average
  end


end
