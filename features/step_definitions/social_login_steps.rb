Given /^I am logged out from "([^"]+)"$/ do |network_name|
  network = Network::instance_of(network_name, browser)
  network.do_logout
end

Given /^I am not logged in the platform$/ do
  browser.goto PLUGIN_BUILDER_URL
  login = browser.a :class => 'gd-login-facebook'
  begin
    login.wait_until_present(2)
  rescue
    logout = browser.a :text => 'Logout'
    logout.when_present(10).click
    login.wait_until_present(2)
  end
end

Given /^I am on the plugin builder$/ do
	browser.goto PLUGIN_BUILDER_URL
end

When /^I login in the platform using "([^"]+)", "([^"]+)" and "([^"]+)"$/ do |network_name, email, password|
  network = Network::instance_of(network_name, browser)
  login = network.gd_login_button(browser)
  login.when_present(3).click
  network.login(email, password)
end

Then /^I should see my "([^"]+)"$/ do |name|
  label = browser.h4 :text => name
  label.wait_until_present(3)
  label.should exist
end
