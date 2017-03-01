require_relative 'employee'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require 'bundler/setup'
require "active_record"
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "employees.db"
  )

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

  p Employee

end
