class Article
  include Mongoid::Document
  field :url, type: String
  field :site_text, type: String
  field :author, type: String
  field :headline, type: String
  field :posted_by, type: String
  field :posted_on, type: Time

  field :related_terms

  validates_presence_of :site_text, :url, :author, :headline

  embeds_many :sentences

  after_create :parse_sentences

  def parse_sentences
    site_text.scan(/.+?[?!.]/).each do |sentence|

      begin
        sentences << Sentence.new(sentence_text: sentence)
      rescue Exception => e
        puts e.message
      end
    end

    sentences
  end

end

