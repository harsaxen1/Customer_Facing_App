
Then(/^I search for any product eg: SKU "([^"]*)"$/) do |sku|

  find_element(xpath: "//*[contains(@text, 'What can we help you find?')]").click
  find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText").send_keys(sku)
  Appium::TouchAction.new.tap(x:0.99, y:0.99, count: 1).perform
end


And(/^Add the item & go to the Cart Page$/) do

  sleep 10
  3.times { Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.2, end_x: 0.5, end_y: 0.8, duration:600).perform }
  until exists{ find_element(xpath: "//android.widget.Button[contains(@text, 'ADD TO CART')]") } do
    Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.2, duration:600).perform
  end
  find_element(xpath: "//android.widget.Button[contains(@text, 'ADD TO CART')]").click
end

Then(/^I verify Cart Page$/) do
  sleep 10
  find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.Button[4]/android.view.ViewGroup[2]").click
end

Then(/^I click on persistent checkout button CTA$/) do
  sleep 10
  find_element(xpath: " /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[1]/android.view.View[35]/android.view.View/android.widget.Button").click
end