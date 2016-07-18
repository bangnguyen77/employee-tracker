require('spec_helper')

describe(Employee) do
  describe("#division") do
    it "tells which division it belongs to" do
      test_division = Division.create({:name => "HR"})
      test_employee = Employee.create({:name => "Bob", :division_id => test_division.id})
      expect(test_employee.division()).to(eq(test_division))
    end
  end
end
