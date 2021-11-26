Then(/^User views a Hot Topic bar "([^"]*)"$/) do |msg|
  sleep 4
  wc_message = find_element(xpath: "//android.widget.TextView[@text = 'Kitchen Storage']").text
  if wc_message != msg
    fail("Expected message is #{msg}, actual message is #{wc_message}")
  end
end

And(/^User taps on any one Hot topic bar and web view opens$/) do
  sleep 3
  find_element(xpath: "//android.widget.TextView[@text = 'Kitchen Storage']").click
end

And(/^I verify I landed on webview as view text "([^"]*)"$/) do |msg|
  sleep 3
  web_view =  find_element(xpath: "//android.widget.TextView[@text = 'WebView']").text
  if web_view != msg
    fail("Expected message is #{msg}, actual message is #{web_view}")
  end
end

And(/^User taps on back button$/) do
  sleep 3
  find_element(xpath: "//android.widget.ImageButton[@content-desc='Navigate up']").click
end
