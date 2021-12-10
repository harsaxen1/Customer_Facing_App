Given(/^I land on  Account page$/) do
  sleep 5
  (find_element(xpath: "(//android.widget.TextView[@text = 'Account'])")).click
end

When("I tap on Sign In button") do
  sleep 2
  (find_element(xpath: "(//android.widget.TextView[@text='SIGN IN'])")).click
end


And(/^I enter valid email address in Email Address as "([^"]*)"$/) do |string|
  sleep 2
  (find_element(xpath: "(hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText)")).send_keys(string)
  # (find_element(xpath: "(//android.widget.EditText)")).send_keys(string)
end

And(/^I enter valid password in Password Field as "([^"]*)"$/) do |string|
  (find_element(xpath: "(/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.EditText)")).send_keys(string)
end

And(/^I tap on Sign In CTA$/) do
  sleep 3
  (find_element(xpath: "(//android.widget.TextView[@text = 'SIGN IN'])")).click
end

And(/^Sign In \- Error message is displayed$/) do
  find_element(xpath: "(//android.widget.TextView[@text = 'SIGN IN'])")
end

And(/^I verify the "([^"]*)" message is displayed$/) do |msg|
  er_message = find_element(xpath: ("//android.widget.TextView[@text = 'The Email or Password you entered is incorrect, please try again.']")).text

  if er_message != msg
    fail("Expected message is #{msg}, actual message is #{er_message}")
  end
end

Then(/^I verify "([^"]*)" title is displayed on Sign in page$/) do |msg|
  #sn_message = find_element(xpath: ("//android.widget.TextView(@index = 1)"
  sleep 5
  sn_message= find_element(xpath: ("//android.widget.TextView[@text = 'Sign in']")).text
  if sn_message != msg
    fail("Expected message is #{msg}, actual message is #{sn_message}")
  end
end