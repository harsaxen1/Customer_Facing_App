When(/^I tap on Accessibility statement button$/) do
  sleep 3
  scroll_to("Accessibility Statement")
  find_element(xpath: "//android.widget.TextView[@text='Accessibility Statement']").click
end

# Then(/^I verify I landed on webview as to  verify text "([^"]*)"$/) do |msg|
#   sleep 3
#   as_msg = find_element(xpath: "//android.widget.TextView[@text = 'Accessibility Statement']").text
#   if as_msg != msg
#     fail("Expected title is #{msg}, actual title is #{as_msg}")
#   end
# end

And(/^User taps on back button of webview$/) do
  sleep 5
  find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup").click
end

And(/^I verify that I landed back on Accounts page$/) do
  sleep 5
  #element = find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView[1]")
  element = find_element(xpath: ("//android.widget.TextView[@text = 'My Wallet']"))
  msg=element.text
  sleep 2
  comp_msg = "My Wallet"
  if msg != comp_msg
    fail("Expected title is #{comp_msg} , actual title is #{msg}")
  end
end

Then(/^I verify I landed on webview as to  verify text (.*)$/) do |msg|
  sleep 3
  if msg == 'Accessibility Statement'
    as_msg = find_element(xpath: "//android.widget.TextView[@text = 'Accessibility Statement']").text
  else if  msg == 'Contact Us'
         as_msg = find_element(xpath: "//android.widget.TextView[@text = 'Contact Us']").text
  else
         as_msg = find_element(xpath: "//android.widget.TextView[@text = 'Email Preferences']").text
  end
  end
  if as_msg != msg
    fail("Expected title is #{msg}, actual title is #{as_msg}")
  end

  end
