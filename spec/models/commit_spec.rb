# == Schema Information
#
# Table name: commits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message    :text
#  revision   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Commit do
  # describe ".parse_bitbucket_payload" do
  #   let(:data) { JSON.parse File.read('spec/assets/bitbucket_hook.json') }
  #   let!(:user) {FactoryGirl.create(:user, name: 'Terry Tai',
  #     email: 'poshboytl@gmail.com')}
  #   subject { Commit.parse_bitbucket_payload(data) }
  #
  #   it { expect { subject }.to change(Commit, :count).by(1) }
  #
  #   context "check detail" do
  #     before { Commit.parse_bitbucket_payload(data) }
  #     subject { Commit.last }
  #     its(:message) { should == "#58 Added some more things to xman.rb" }
  #     its(:revision) { should == "620ade18607ac42d872b568bb92acaa9a28620e9" }
  #     its(:user) { should == user }
  #   end
  # end
end
