When /^I add a new valid profile picture$/ do
  on_page(SettingsPage).upload_file '/Users/danielforkosh/Downloads/columns.jpg'
end

Then /^my new profile picture should be set$/ do
  on_page(SettingsPage)
end

When /^update contact info form with random data$/ do
  on_page(SettingsPage).populate_contact_info_form
  on_page(SettingsPage).save_all
end

Then /^the settings page should not have any errors$/ do
  on_page(SettingsPage).error_list?.should == false
end

Then /^the settings page should have the error "(.*?)"$/ do |expected_error|
  on_page(SettingsPage).error_messages.should include expected_error
end

Then /^the contact info table should be populated with:$/ do |table|
  on_page(SettingsPage).verify_data table.hashes.first
end

When /^I sign into the application$/ do
  on_page(LoginPage).login_successfully
end

When /^I sign in using username "(.*?)" and password "(.*?)"$/ do |username, password|
  on_page(LoginPage).input_login_credentials(username,password)
  on_page(LoginPage).sign_in
end

Given /^I am on the homepage$/ do
  visit_page(HomePage)
end

When /^I navigate to the login page$/ do
  on_page(HomePage).login
end

When /^go to the settings page$/ do
  on_page(HomePage).go_to_settings
end

When /^update contact info form with:$/ do |table|
  data = table.hashes
  data.each do |row|
    on_page(SettingsPage).populate_contact_info_form(row)
  end
  on_page(SettingsPage).save_all
end
