class EmployeesController < ApplicationController
  def index
    employees = Employee.all
    render status: 200, json: { employees: employees }
  end
end
