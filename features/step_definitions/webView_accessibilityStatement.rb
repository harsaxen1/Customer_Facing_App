
And(/^I click on Accessibility statement in Account Page$/) do
  scroll_to_exact("Accessibility Statement")
  (find_element(xpath: "(//android.widget.TextView[@text = 'Accessibility Statement'])")).click
end

Then(/^I land on Accessibility statement Page & Verify$/) do
  (find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView")).click
end