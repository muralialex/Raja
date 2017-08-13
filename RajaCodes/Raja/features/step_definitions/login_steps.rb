Given(/^URL of a CK Tenant$/) do
  visit_page LoginPage
end

Given /^I Provide eMailID  as "(.*?)"$/ do |eMailID|
  @current_page.login eMailID
end


Then(/^I should see Non SSO Page$/) do
  on CiscoNonSSOPage do |page|
    page.wait_until_page_loads
    page.has_expected_title?
  end
end

When(/^I Provide Password "(.*?)"$/) do |pwd|
  on(CiscoNonSSOPage).input_password pwd
end

And(/^Sign In$/) do
  on(CiscoNonSSOPage).login
end

Then(/^I should see CK Landing Page$/) do
  on(CiscoNonSSOPage).wait_for_page_load
end
