require 'spec_helper'

describe Article do
  let(:fields) {
    {
      site_text: 'Today is a day. Oh yes it is.',
      url: 'www.someurl.com',
      author: 'Auturo the author',
      headline: 'Headline news'
    }
  }

  it 'checks the required fields' do
    expect(Article.create.errors.any?).to be_true

    expect(Article.create(fields).errors.any?). to be_false
  end

  describe '#parse_sentences' do

    let(:article) { Article.new(fields) }
    let(:sentences) { article.parse_sentences }

    it 'returns an array' do
      expect(sentences.class).to be(Array)
    end

    it 'parses sentence text into sentence words' do
      sentences.each do |w|
        expect(w.class).to be(Sentence)
      end
    end

    it 'contains the correct sentences' do
      expect(sentences.first.sentence_text).to eq('Today is a day')
      expect(sentences.second.sentence_text).to eq('Oh yes it is')
    end

  end
end
