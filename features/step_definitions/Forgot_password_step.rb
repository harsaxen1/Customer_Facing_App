And(/^I tap on Forgot Password button$/) do
  sleep 3
  find_element(xpath: ("//android.widget.TextView[@text= 'Forgot Password'")).click
end


