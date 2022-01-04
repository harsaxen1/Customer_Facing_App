require "appium_lib"

def caps
{ caps: {
    deviceName: "Anyname",
    platformName: "Android",
    app: (File.join(File.dirname(__FILE__), "app-dev-release-4.apk")),
    # appPackage: "com.tcs",
    # appActivity: "MainActivity",
    # newCommandTimeout: "3600"
}}
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
