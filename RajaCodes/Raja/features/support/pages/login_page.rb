class LoginPage
  include PageObject, TestDataLoader

  text_field :email, :name => "email"
  button :next, :name => "next"
  
  page_url TestDataLoader.get_url('tenant_home')
  
  
  def login(eMailID)
    self.email = eMailID
    self.next
  end


  
end