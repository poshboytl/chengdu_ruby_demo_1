require './lib/parsers/parser_base'
require './lib/parsers/bitbucket_parser'
require './app/services/commit_service'

require 'json'

describe CommitService do
  let(:data) { { 'payload' => File.read('spec/assets/bitbucket_hook.json') } }
  let(:service) { CommitService.new(data) }

  describe '#initialize' do
    subject { service }
    its(:data) { should == JSON.parse(data['payload']) }
  end

  describe '#parseable?' do
    context 'parseable' do
      specify { service.parseable?.should be_true }
    end
    context 'not parseable' do
      let(:service) { CommitService.new({}) }
      specify { service.parseable?.should be_false }
    end
  end

  describe '#parse' do
    context 'parseable' do
      let(:parser) { stub(:parser) }
      before do
        BitbucketParser.should_receive(:new).with(service.data).and_return(parser)
        parser.should_receive(:parseable?).and_return(true)
        parser.should_receive(:parse)
      end
      specify { service.parse.should be_nil }
    end

    context 'not parseable' do
    end
  end

end
