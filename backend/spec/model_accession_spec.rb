require 'spec_helper'

describe 'Accession model' do

  it "throws an error when no provenance statement is provided" do
    opts = {:provenance => nil}

    expect { create_accession(opts) }.to raise_error(JSONModel::ValidationException)
  end

end
