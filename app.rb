require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/division")
require("./lib/employee")
require("pg")

get("/") do
  @divisions = Division.all()
  erb(:index)
end

post("/divisions") do
  name = params.fetch("name")
  @division = Division.create({:name => name})
  @divisions = Division.all()
  erb(:index)
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

patch("/divisions/:id") do
  name = params.fetch("name")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:name => name})
  @divisions = Division.all()
  erb(:division)
end

delete("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  @division.delete()
  @divisions = Division.all()
  erb(:index)
end

post("/divisions/:id/employees") do
  name = params.fetch("employee_name")
  division_id = params.fetch("division_id").to_i()
  @division = Division.find(params.fetch("id").to_i())
  @employee = Employee.create({:name => name, :division_id => division_id})
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:division)
end
