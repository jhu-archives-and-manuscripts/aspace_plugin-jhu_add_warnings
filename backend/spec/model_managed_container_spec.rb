require 'spec_helper'
require_relative 'factories'
require_relative 'container_spec_helper'

describe 'Managed Container model' do

  it "throws a warning when no barcode is provided" do
    expect {
      create(:json_top_container, :barcode => nil)
    }.to raise_error(JSONModel::ValidationException)
  end


end
