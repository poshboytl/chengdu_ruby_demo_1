require './lib/parsers/parser_base'
require './lib/parsers/bitbucket_parser'
require 'json'

describe BitbucketParser do
  let(:data) { JSON.parse(File.read('spec/assets/bitbucket_hook.json'))  }
  let(:parser) { BitbucketParser.new(data) }
  subject { parser }

  describe '#initialize' do
    its(:data) { should == data }
  end

  describe '#parse_commit' do
    class User; end
    let(:commits) { stub(:commits) }
    let(:user) { stub(:user, :commits => commits) }

    before do
      User.stub(:find_by_email).with('poshboytl@gmail.com').and_return(user)
      User.stub(:find_by_email).with('superman@super.man').and_return(nil)
      User.stub(:find_by_name).with('Superman').and_return(nil)
    end
    after { parser.parse }

    specify { user.commits.should_receive(:create).
           with(message: '#58 Added some more things to xman.rb',
      revision: '620ade18607ac42d872b568bb92acaa9a28620e9').once }
  end

end