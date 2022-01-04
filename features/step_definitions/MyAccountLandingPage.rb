Then(/^I see "([^"]*)" message as a Guest User$/) do |msg|
  wc_msg = (find_element(xpath: "(//android.widget.TextView[@text = 'welcomeHeaderGreeting'])")).text
  if wc_msg != msg
    fail("Expected message is #{msg}, actual message is #{wc_msg}")
  end
end

And(/^I see Sign In CTA$/) do
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'SIGN IN'])")).text).to eql "SIGN IN"

end

And(/^I see Create Account option$/) do
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Create an account'])")).text).to eql "Create an account"

end

Then(/^I see My Orders tile$/) do
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'My Orders'])")).text).to eql "My Orders"
end

And(/^I see My Wallet tile$/) do
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'My Wallet'])")).text).to eql "My Wallet"
end

And(/^I see Address card$/) do
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Addresses'])")).text).to eql "Addresses"

end

And(/^I see Lists card$/) do
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Lists'])")).text).to eql "Lists"
end

And(/^I see Perks card$/) do
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'Perks'])")).text).to eql "Perks"
end

And(/^I see My Store card$/) do
  expect((find_element(xpath: "(//android.widget.TextView[@text = 'My Store'])")).text).to eql "My Store"
end