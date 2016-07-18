require('spec_helper')

describe(Division) do
  describe("#employees") do
    it "tells which employees are in it" do
      test_division = Division.create({:name => "HR"})
      test_employee = Employee.create({:name => "Bob", :division_id => test_division.id})
      expect(test_division.employees()).to(eq([test_employee]))
    end
  end
end
