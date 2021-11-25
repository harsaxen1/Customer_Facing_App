
Before do
  $driver.start_driver
  @driver.manage.timeouts.implicit_wait = 20
end

After do
  sleep 5
  $driver.driver_quit
end