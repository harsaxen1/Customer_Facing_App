Given(/^I landed on Homepage and I see "([^"]*)" message$/) do |msg|
  sleep 5
  scroll_to_exact("Welcome")
  wc_message = find_element(xpath: "//android.widget.TextView[(@text = 'Welcome')]").text
  if wc_message != msg
    fail("Expected message is #{msg}, actual message is #{wc_message}")
  end
end
