require_relative 'spec_helper'

describe "Accessions" do

  before(:all) do

    @repo = create(:repo, :repo_code => "accession_test_#{Time.now.to_i}")
    set_repo @repo

    @coll_mgmt_accession = create(:accession)
    @other_accession = create(:accession, :title => "Link to me")

    @archivist_user = create_user(@repo => ['repository-archivists'])
    @manager_user = create_user(@repo => ['repository-managers'])


    @accession_title = "Exciting new stuff - \u2603 - #{Time.now.to_i}"
    @me = "#{$$}.#{Time.now.to_i}"

    @shared_4partid = generate(:four_part_id)

    @dates_accession_title = "Accession_#{Time.now.to_i}"
    @dates_4partid = generate(:four_part_id)

    @exdocs_accession_title = "Accession_#{Time.now.to_i}"
    @exdocs_4partid = generate(:four_part_id)

    run_all_indexers

    @driver = Driver.new.login_to_repo(@archivist_user, @repo)
  end


  after(:all) do
    @driver.quit
  end

  it "reports errors when updating an Accession with invalid data" do
    @driver.click_and_wait_until_gone(:link, 'Edit')
    @driver.clear_and_send_keys([:id, "accession_id_0_"], "")
    @driver.find_element(:css => "form#accession_form button[type='submit']").click
    expect {
      @driver.find_element_with_text('//div[contains(@class, "error")]', /Identifier - Property is required but was missing/)
    }.to_not raise_error
    # cancel first to back out bad change
    @driver.find_element(:link, "Cancel").click
    @driver.find_element_with_text('//div[contains(@class, "warning")]', /Container Summary - Property was missing/)
    @driver.find_element_with_text('//div[contains(@class, "warning")]', /Content Description - Property was missing/)
    @driver.find_element_with_text('//div[contains(@class, "warning")]', /Access Restrictions Note - Property was missing/)
    @driver.find_element_with_text('//div[contains(@class, "warning")]', /Provenance - Property was missing/)
  end


end
