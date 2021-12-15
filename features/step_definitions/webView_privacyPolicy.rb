
And(/^I click on Privacy Policy in Account Page$/) do
  scroll_to_exact("Privacy Policy")
  (find_element(xpath: "(//android.widget.TextView[@text = 'Privacy Policy'])")).click
end

Then(/^I land on Privacy Policy Page & Verify$/) do
  (find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView")).click
end