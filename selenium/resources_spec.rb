describe "Resources and archival objects" do

  before(:all) do
    @repo = create(:repo)
    set_repo(@repo)

    @accession = create(:accession, {
                          :collection_management => build(:collection_management)
                        })

    @resource = create(:resource)

    @archival_object = create(:archival_object, :resource => {'ref' => @resource.uri})

    @user = create_user(@repo => ['repository-archivists'])
    @driver = Driver.new.login_to_repo(@user, @repo)
  end

  before(:each) do
    @driver.go_home
  end


  after(:all) do
    @driver.quit
  end



  it "reports errors and warnings when creating an invalid Resource" do
    @driver.find_element(:link, "Create").click
    @driver.find_element(:link, "Resource").click
    @driver.find_element(:id, "resource_title_").clear
    @driver.find_element(:css => "form#resource_form button[type='submit']").click

    @driver.find_element_with_text('//div[contains(@class, "error")]', /Identifier - Property is required but was missing/)
    @driver.find_element_with_text('//div[contains(@class, "error")]', /Title - Property is required but was missing/)
    @driver.find_element_with_text('//div[contains(@class, "error")]', /Number - Property is required but was missing/)
    @driver.find_element_with_text('//div[contains(@class, "error")]', /Type - Property is required but was missing/)
    @driver.find_element_with_text('//div[contains(@class, "warning")]', /Container Summary - Property was missing/)


    @driver.find_elements(:xpath => '//div[contains(@class, "warning")]').length.should eq(0)

    @driver.find_element(:css, "a.btn.btn-cancel").click
  end




end
