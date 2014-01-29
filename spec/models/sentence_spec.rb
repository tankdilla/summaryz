require 'spec_helper'

describe Sentence do

  let(:sentence_word) { double(SentenceWord)}

  before do
    SentenceWord.stub(:save).and_return(true)
  end

  describe '#parse_sentence_words' do
    it 'parses sentence text into sentence words' do

    end
  end
end
