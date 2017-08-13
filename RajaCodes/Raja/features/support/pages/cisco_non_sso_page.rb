class CiscoNonSSOPage
  include PageObject, TestDataLoader


  text_field :password, :name => 'password'
  button :login_to_ck, :value => 'Sign In'
  button :login_page, :class => 'cckui-btn-header cckui-btn-image cckui-btn'

  expected_title TestDataLoader.get_title('non_sso_page')


  def input_password (pwd)
    self.password = pwd
  end

  def login
    self.login_to_ck
  end

  #:ToDo: Remove Sleep
  def wait_until_page_loads
    sleep 15
  end

  #:ToDo: Remove TimeOut
  def wait_for_page_load
    self.wait_until(60, "Post login landing page not loaded in 30 seconds") do
      self.login_page?
    end
  end
  
end