class HomePage
  include PageObject
  
  page_url("http://www.blogtalkradio.com")
  
  link(:login, :id => 'login-link')
  li(:profile_tab, :id => 'profileTab')
  link(:settings, :text => 'Settings')
  
  def go_to_settings
    profile_tab_element.hover
    settings
  end
end
