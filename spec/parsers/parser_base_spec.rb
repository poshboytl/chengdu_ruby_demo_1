require './lib/parsers/parser_base'

describe ParserBase do
  let(:parser) { ParserBase.new }
  subject { parser }

  describe '#parserable' do
    its(:parseable?) { should be_false }
  end

  describe '#parse' do
    let(:commits) { [stub(:commit), stub(:commit)] }
    before { parser.stub(:data).and_return({'commits' => commits}) }
    after { parser.parse }

    specify { parser.should_receive(:parse_commit).twice }
  end
end