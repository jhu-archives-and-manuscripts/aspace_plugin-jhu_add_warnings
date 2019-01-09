require 'spec_helper'

describe 'Accession model' do

  it "throws a warning when no content description is provided" do
    opts = {:content_description => nil}

    expect { create_accession(opts) }.to raise_error(JSONModel::ValidationException)
  end

  it "throws a warning when no access restrictions note is provided" do
    opts = {:access_restrictions_note => nil}

    expect { create_accession(opts) }.to raise_error(JSONModel::ValidationException)
  end

  it "throws a warning when no provenance statement is provided" do
    opts = {:provenance => nil}

    expect { create_accession(opts) }.to raise_error(JSONModel::ValidationException)
  end

end
