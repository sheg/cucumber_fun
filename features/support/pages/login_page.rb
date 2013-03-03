class LoginPage
  include PageObject
  include DataMagic

  text_field(:username, :id => 'ctl00_ContentMain_Login1_UserName')
  text_field(:password, :id => 'ctl00_ContentMain_Login1_Password')
  link(:sign_in, :id => 'ctl00_ContentMain_Login1_LoginButton')

  def login_successfully(data = {})
    populate_page_with data_for(:login_page, data)
    sign_in
  end

#  def login_successfully(data = {})
#    data = DEFAULT_DATA.merge(data)
#    input_login_credentials(data['username'], data['password'])
#    sign_in
#  end
#
#  def input_login_credentials(username,password)
#    self.username = username
#    self.password = password
#  end
end
