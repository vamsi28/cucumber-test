class Network

  def initialize(browser)
    @browser = browser
  end

  def self.instance_of(network, browser)
    Object.const_get(network).new browser
  end

  def login(email, password)
    previous_window = @browser.window
    popup = select_login_popup
    enter_login_details email, password
    Watir::Wait.until { not popup.present? }
    previous_window.use
  end

  def do_logout
    @browser.goto url
    begin
      element_to_wait .wait_until_present(1)
    rescue
      logout = button_logout
      logout.when_present(3).click
      element_to_wait.wait_until_present(1)
    end
  end

private
  def select_login_popup
    popup = login_window
    popup.wait_until_present(3)
    popup.use
  end

  def enter_login_details(email, password)
    field_email.set email
    field_password.set password
    button_login.click
  end

end

class Facebook < Network
  def gd_login_button(browser)
    browser.link :class => "gd-login-facebook"
  end

  def login_window
    @browser.window :title => /Facebook/
  end

  def field_email
    @browser.text_field :id => 'email'
  end

  def field_password
    @browser.text_field :id => 'pass'
  end

  def button_login
    @browser.button :name => 'login'
  end

  def url
    "https://www.facebook.com"
  end

  def element_to_wait
    @browser.element :id => 'loginbutton'
  end

  def button_logout
    settings = @browser.a :id => 'navAccountLink'
    settings.when_present(3).click
    @browser.element(:css => "#logout_form input[type='submit']")
  end
end

class LinkedIn < Network
  def gd_login_button(browser)
    browser.link :class => "gd-login-linked-in"
  end

  def login_window
    @browser.window :title => /LinkedIn/
  end

  def field_email
    @browser.text_field :name => 'session_key'
  end

  def field_password
    @browser.text_field :name => 'session_password'
  end

  def button_login
    @browser.button :name => 'authorize'
  end

  def url
    "https://www.linkedin.com"
  end

  def element_to_wait
    @browser.element :id => 'signin'
  end

  def button_logout
    settings = @browser.a(:class => 'account-toggle')
    settings.when_present(3).hover
    logout = @browser.element(:class => "account-submenu-split-link")
  end

end