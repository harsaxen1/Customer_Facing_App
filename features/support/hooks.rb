Before do
  $driver.start_driver
end

After do
  sleep 8
  $driver.driver_quit
end