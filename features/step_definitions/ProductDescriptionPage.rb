When(/^I tap on PCP button, I should see PDP web view$/) do
  sleep 3
  scroll_to_exact("Open PDP")
  sleep 3
  find_element(xpath: "(//android.widget.TextView[@text = 'Open PDP'])").click
  sleep 3
end


And(/^I tap on back button on web view of PDP$/) do
  find_element(xpath: "(/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1])").click
end