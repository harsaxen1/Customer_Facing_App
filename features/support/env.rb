require "appium_lib"

def caps
{ caps: {
    deviceName: "Anyname",
    platformName: "Android",
<<<<<<< HEAD
    app: (File.join(File.dirname(__FILE__), "app-dev-release.apk")),
=======
    app: (File.join(File.dirname(__FILE__), "app-dev-release-4.apk")),
>>>>>>> aeeeba110217f908f0a6809a90f3133830c5c50a
    # appPackage: "com.tcs",
    # appActivity: "MainActivity",
    # newCommandTimeout: "3600"
}}
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
