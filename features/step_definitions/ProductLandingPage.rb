When(/^I tap on PLP button$/) do
  sleep 3
  scroll_to_exact("Open PLP")
  sleep 3
  find_element(xpath: "(//android.widget.TextView[@text = 'Open PLP'])").click
  sleep 3
end

#Then(/^I should be able to see the PLP Web view and see text "([^"]*)"$/) do |text|
# sleep 5
# webview_header = find_element(xpath: "(//android.widget.EditText[@text = 'Search Product']").text
# if webview_header != text
#  fail("Expected message is #{text}, actual message is #{webview_header}")
# end
#end


When(/^I tap on back button$/) do
  sleep 5
  find_element(xpath: "(/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1])").click
end

