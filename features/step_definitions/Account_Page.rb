Given("I land on Account page") do
  sleep 5
  (find_element(xpath: "(//android.widget.TextView[@text = 'Account'])")).click
end

When("I tap on Create Account button") do
  sleep 3
  (find_element(xpath: "(//android.widget.TextView[@text = 'Create an Account'])")).click
end

Then(/^I enter text in First Name as "([^"]*)"$/) do |string|
  sleep 3
  find_element(xpath: "(/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.EditText)").send_keys(string)
end

And("I enter text in Last Name as {string}") do |string|
  sleep 3
  (find_element(xpath: "(/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.EditText)")).send_keys(string)
end

And(/^I enter valid email address in Email ID as "([^"]*)"$/) do |string|
  (find_element(xpath: "(/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.EditText)")).send_keys(string)
end

And(/^I enter valid password in Password as "([^"]*)"$/) do |string|
  (find_element(xpath: "(/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]/android.widget.EditText)")).send_keys(string)
end

And(/^I enter valid Zip in Zip Code as "([^"]*)"$/) do |string|
  (find_element(xpath: "(/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[6]/android.widget.EditText)")).send_keys(string)
end

And("I tap on Create Account CTA") do
  sleep 3
  (find_element(xpath: "(//android.widget.TextView[@text = 'CREATE ACCOUNT'])")).click
end

And("Create Account - Success Page is displayed") do
  sleep 3
  find_element(xpath: "(//android.widget.TextView[@text = 'Welcome to'])")
end

And(/^I verify "([^"]*)" message is displayed$/) do |msg|
  wc_message = find_element(xpath: "//android.widget.TextView[@text = 'Welcome to']").text

  if wc_message != msg
    fail("Expected message is #{msg}, actual message is #{wc_message}")
  end
end

