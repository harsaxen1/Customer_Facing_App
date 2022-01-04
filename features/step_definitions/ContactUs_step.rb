When(/^I tap on Contact Us button$/) do
  sleep 5
  scroll_to("Contact Us")
  find_element(xpath: "//android.widget.TextView[@text='Contact Us']").click
end