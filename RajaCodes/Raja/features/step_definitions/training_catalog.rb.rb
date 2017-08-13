Given(/^Training Catalog$/) do
  on(TrainingCatalogPage).navtoPage "learning","trainingCatalog"
  #on(CiscoNonSSOPage).wait_for_page_load

end

When(/^I Search  Title "([^"]*)" in the Catalog$/) do |courseTitle|
  on(TrainingCatalogPage).searchCourse courseTitle
end

Then(/^I should see Course In Search Results$/) do
  pending
end

When(/^I Register for the Course "([^"]*)" From Training Catalog$/) do
  pending
end

Then(/^I should Get Success Message$/) do
  pending
end