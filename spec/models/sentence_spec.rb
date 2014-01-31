require 'spec_helper'

describe Sentence do

  let(:sentence_word) { double(SentenceWord)}

  before do
    SentenceWord.stub(:save).and_return(true)
  end

  describe '#parse_sentence_words' do
    let(:sentence) { Sentence.new(sentence_text: 'This is a sentence.') }
    let(:words) { sentence.parse_sentence_words }

    it 'returns an array' do
      expect(words.class).to be(Array)
    end

    it 'parses sentence text into sentence words' do
      words.each do |w|
        expect(w.class).to be(SentenceWord)
      end
    end

    it 'contains the correct words' do
      %w{This is a sentence}.each_with_index do |w, index|
        expect(words[index].word_text).to eq(w)
      end
    end
  end
end
