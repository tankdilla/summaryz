require 'spec_helper'

describe Article do
  let(:fields) {
    {
      site_text: 'Today is a day.',
      url: 'www.someurl.com',
      author: 'Auturo the author',
      headline: 'Headline news'
    }
  }

  it 'checks the required fields' do
    expect(Article.create.errors.any?).to be_true

    expect(Article.create(fields).errors.any?). to be_false
  end

  describe '#parse_site_text' do

    let(:article) {
      Article.new(fields)
    }

  end
end
