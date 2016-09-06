require 'spec_helper'

describe 'Resource model' do


  it "throws an error when no container summary is provided" do
    opts = {:container_summary => nil}

    expect { create_resource(opts) }.to raise_error(JSONModel::ValidationException)
  end


end
