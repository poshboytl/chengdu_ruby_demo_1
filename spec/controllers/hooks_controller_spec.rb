require 'spec_helper'

describe HooksController do
  describe "POST create" do
    let(:bitbucket_pl) { File.read('spec/assets/bitbucket_hook.json') }
    context "parseable" do
      before { post :create, payload: bitbucket_pl }
      specify { response.should be_success }
    end

    context "not parseable" do
      before { post :create }
      specify { response.should_not be_success }
    end
  end
end