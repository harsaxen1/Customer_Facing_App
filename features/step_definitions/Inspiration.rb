When("I tap on Inspiration tab") do
  sleep 3
  find_element(xpath: "(//android.widget.TextView[@text = 'Inspiration'])").click
end

Then("I land on Inspiration page") do
  sleep 3
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'All Inspiration'])")).text).to eql "All Inspiration"
end

Then(/^I view All inspiration tab selected by default$/) do
  sleep 3
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'All Inspiration'])")).text).to eql "All Inspiration"
end

Then(/^I tap on Projects$/) do
  find_element(xpath: "(//android.widget.TextView[@text = 'Projects'])").click
end

And(/^I verify Projects web view is displayed$/) do
  sleep 3
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Projects'])")).text).to eql "Projects"
end

When(/^I tap on Tips$/) do
  find_element(xpath: "(//android.widget.TextView[@text = 'Tips'])").click
end

Then(/^I verify Tips web view is displayed$/) do
  sleep 3
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Tips'])")).text).to eql "Tips"
end

When(/^I tap on videos$/) do
  find_element(xpath: "(//android.widget.TextView[@text = 'Videos'])").click
end

Then(/^I verify Videos web view is displayed$/) do
  sleep 3
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Videos'])")).text).to eql "Videos"
end

When(/^I tap on Blog Posts$/) do
  find_element(xpath: "(//android.widget.TextView[@text = 'Blog Posts'])").click
end

Then(/^I verify Blog Posts is displayed$/) do
  sleep 3
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Blog Posts'])")).text).to eql "Blog Posts"
end

When(/^I tap on Customer Photos$/) do
  find_element(xpath: "(//android.widget.TextView[@text = 'Customer Photos'])").click
end

Then(/^I verify Customer Photos web view is displayed$/) do
  sleep 3
  swipe_to("Before & Afters")
  sleep 3
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Customer Photos'])")).text).to eql "Customer Photos"
end

When(/^I tap on Container store Blog$/) do
  find_element(xpath: "(//android.widget.TextView[@text = 'Container Stories Blog'])").click
end

Then(/^I verify Container store Blog is displayed$/) do
  sleep 3
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Container Stories Blog'])")).text).to eql "Container Stories Blog"
end

When(/^I tap on Before & After$/) do
  find_element(xpath: "(//android.widget.TextView[@text = 'Before & Afters'])").click
end

Then(/^I verify Before & After is displayed$/) do
  sleep 3
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Before & Afters'])")).text).to eql "Before & Afters"
end