When(/^I tap on Email Preferences button$/) do
  sleep 5
  scroll_to("Email Preferences")
  find_element(xpath: "//android.widget.TextView[@text='Email Preferences']").click
end