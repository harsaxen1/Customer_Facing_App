

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