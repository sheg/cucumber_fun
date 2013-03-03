require_relative '../modules/errors'

class SettingsPage
  include PageObject
  include ErrorDiv
  include DataMagic

  link(:first_name_config, :id => 'ctl00_ContentMain_myProfile1_EditFirstName')
  link(:last_name_config, :id => 'ctl00_ContentMain_myProfile1_EditLastName')
  link(:display_name_config, :id => 'ctl00_ContentMain_myProfile1_EditDisplayName')
  link(:email_config, :id => 'ctl00_ContentMain_myProfile1_EditEmail')
  link(:contact_phone_config, :id => 'ctl00_ContentMain_myProfile1_EditContactNumber')
  text_field(:first_name, :id => 'ctl00_ContentMain_myProfile1_txtNameFirst')
  text_field(:last_name, :id => 'ctl00_ContentMain_myProfile1_txtNameLast')
  text_field(:display_name, :id => 'ctl00_ContentMain_myProfile1_txtDisplayName')
  text_field(:email, :id => 'ctl00_ContentMain_myProfile1_txtEmail')
  text_field(:contact_phone, :id => 'ctl00_ContentMain_myProfile1_txtContactPhone')
  link(:save_all, :id => 'ctl00_ContentMain_myProfile1_LinkButton1')

  def upload_file file
    @browser.execute_script("document.getElementById('ctl00_ContentMain_myProfile1_RadUpload1file0').removeAttribute('style')")
    @browser.file_field(:id => 'ctl00_ContentMain_myProfile1_RadUpload1file0').set(file)
    @browser.button(:id => 'ctl00_ContentMain_myProfile1_btnCrop').click
  sleep 5
end

  def verify_data (data)
    self.contact_phone.should == data['contact_phone']
    self.display_name.should == data['display_name']
    self.email.should == data['email']
    self.first_name.should == data['first_name']
    self.last_name.should == data['last_name']
  end

  def populate_contact_info_form (data = {})
    open_text_fields
    populate_page_with data_for(:settings_page, data)
  end

  def open_text_fields
    contact_phone_config
    display_name_config
    first_name_config
    last_name_config
    email_config
  end
end
