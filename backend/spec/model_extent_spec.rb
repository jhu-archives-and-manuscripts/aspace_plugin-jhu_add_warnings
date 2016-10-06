require 'spec_helper'

describe 'Extent model' do

  it "reports a warning if accession container_summary has no value" do
    opts = {:container_summary => nil}

    expect { create_accession(opts) }.to raise_error(JSONModel::ValidationException)
  end

  it "reports a warning if resource container_summary has no value" do
    opts = {:container_summary => nil}

    expect { create_resource(opts) }.to raise_error(JSONModel::ValidationException)
  end


end
