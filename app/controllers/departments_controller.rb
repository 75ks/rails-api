class DepartmentsController < ApplicationController
  def index
    departments = Department.all
    render status: 200, json: { departments: departments}
  end
end
