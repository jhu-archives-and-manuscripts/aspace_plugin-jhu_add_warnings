require_relative 'spec_helper'

describe "Resource instances and containers" do

  before(:all) do
    @repo = create(:repo, :repo_code => "instances_test_#{Time.now.to_i}")
    set_repo @repo

    @resource = create(:resource)
    @accession = create(:accession)

    @location_a = create(:location)
    @location_b = create(:location, {
                           :temporary => 'conservation'
                           })
    container_location = build(:container_location, {
                                 :ref => @location_a.uri
                               })
    @container = create(:top_container, {
                          :container_locations => [container_location]
                        })

    # Some containers for searching
    ("A".."E").each do |l|
        create(:top_container, {
                 :indicator => "Letter #{l}",
                 :container_locations => [container_location]
               })
    end

    run_all_indexers

    @driver = Driver.new.login_to_repo($admin, @repo)
  end

  before(:each) do
    @driver.navigate.to("#{$frontend}")
  end


  after(:all) do
    @driver.quit
  end

  it "reports errors when barcode is missing" do
    @driver.find_element_with_text('//div[contains(@class, "warning")]', /Barcode - Property was missing/)
  end

end
