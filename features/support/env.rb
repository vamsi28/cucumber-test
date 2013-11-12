require 'watir-webdriver'

Before do
  API_EXAMPLE_CLIENT_URL ||= "https://api-example-client.intenthq.com/"
end

module HasBrowser
	@@browser = Watir::Browser.new :chrome
	at_exit { @@browser.close }

	def browser
		@@browser
	end
end

World HasBrowser