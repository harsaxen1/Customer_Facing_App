
Then(/^I click on Account$/) do
  (find_element(xpath: "(//android.widget.TextView[@text = 'Account'])")).click
end

And(/^I click on Terms of use in Account Page$/) do
  scroll_to_exact("Terms of Use")
  (find_element(xpath: "(//android.widget.TextView[@text = 'Terms of Use'])")).click
end

Then(/^I land on Terms of use Page & Verify$/) do
  (find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView")).click
end


And(/^I click on Privacy Policy in Account Page$/) do
  scroll_to_exact("Privacy Policy")
  (find_element(xpath: "(//android.widget.TextView[@text = 'Privacy Policy'])")).click
end

Then(/^I land on Privacy Policy Page & Verify$/) do
  (find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView")).click
end



#Accessibility statement Webpage

And(/^I click on Accessibility statement in Account Page$/) do
  scroll_to_exact("Accessibility Statement")
  (find_element(xpath: "(//android.widget.TextView[@text = 'Accessibility Statement'])")).click
end

Then(/^I land on Accessibility statement Page & Verify$/) do
  (find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView")).click
end


#My Designs Page Webpage

When(/^I click on Sign In CTA$/) do
  (find_element(xpath: "(//android.widget.TextView[@text = 'SIGN IN'])")).click
end

And(/^I enter Email Id "([^"]*)" on Text box$/) do |user_name|
  (find_element(xpath: "(//android.widget.TextView[@text = 'Email Address'])")).click
  (find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText")).send_keys(user_name)
end

And(/^I enter password "([^"]*)" on Text Box$/) do |password|
  (find_element(xpath: "(//android.widget.TextView[@text = 'Password'])")).click
  (find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.EditText")).send_keys(password)
end

Then(/^I click sign in CTA & successfully login as a registered User$/) do
  Appium::TouchAction.new.tap(x:0.99, y:0.99, count: 1).perform
  (find_element(xpath: "(//android.widget.TextView[@text = 'SIGN IN'])")).click
end

And(/^I click on My Designs in Account Page$/) do
  (find_element(xpath: "(//android.widget.TextView[@text = 'My Designs'])")).click
end

Then(/^I land on My Designs Page & Verify$/) do
  (find_element(xpath: "(//android.widget.TextView[@text = 'My Designs'])"))
end

