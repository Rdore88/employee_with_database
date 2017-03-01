require_relative 'employee'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require 'bundler/setup'

class EmployeeTest < Minitest::Test

  def robby
    @_robby ||= Employee.new(name: "Robby Dore",
                                email_address: "Rdore88@gmail.com",
                                phone_number: "404-277-3952",
                                salary: 60000
                              )
  end

  def test_employee_exists
    assert Employee
  end

end
