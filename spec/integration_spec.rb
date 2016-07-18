require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("adding a division", {:type => :feature}) do
  it "allows user to add a division" do
    visit ("/")
    fill_in("Division Name", :with => "HR")
    click_button("Add Division")
    expect(page).to have_content("HR")
  end
end

describe("updating a division", {:type => :feature}) do
  it "allows user to update the name of a division" do
    division = Division.create({:id => nil, :name => "HR"})
    visit ("/")
    click_link("HR")
    fill_in("Rename this division:", :with => "Sales")
    click_button("Update")
    expect(page).to have_content("Sales")
  end
end

describe("deleting a division", {:type => :feature}) do
  it "allows user to delete a division" do
    division = Division.create({:id => nil, :name => "HR"})
    visit ("/")
    click_link("HR")
    click_button("Delete division")
    expect(page).to have_content("Welcome to the Employee Tracker")
  end
end

describe("adding an employee", {:type => :feature}) do
  it "allows user to add an employee" do
    division = Division.create({:id => nil, :name => "HR"})
    visit ("/")
    click_link("HR")
    fill_in("employee_name", :with => "Bob")
    click_button("Add employee")
    expect(page).to have_content("Bob")
  end
end
