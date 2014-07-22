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
  embeds_many :proper_nouns

  after_create :set_fields

  def set_fields
    parse_sentences
    set_terms
  end

  def set_terms
    counts = Article.word_counts(site_text)
    counts[:proper_nouns].each do |proper_noun, count|
      self.proper_nouns << ProperNoun.new(term: proper_noun, count: count) unless self.proper_nouns.where(term: proper_noun).first.present?
    end
  end

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

  def self.word_counts(word_string)
    sentences = word_string.scan(/.+?[?!.]/) # .split(/[^a-zA-z0-9\-]/)

    # word_counts = Hash.new { |hash, key| hash[key] = [] }
    all_word_counts = {
      proper_nouns: Hash.new { |hash, key| hash[key] = 0 },
      standard_words: Hash.new { |hash, key| hash[key] = 0 }
    }

    proper_noun_buffer = []

    sentences.each do |sentence|
      sentence.split(/[^a-zA-z0-9\-]/).each do |word|

        if ('A'..'Z').to_a.include? word[0]
          proper_noun_buffer << word
          next
        elsif proper_noun_buffer.present?
          proper_noun = proper_noun_buffer.join(' ')
          proper_noun_buffer = []

          all_word_counts[:proper_nouns][proper_noun] += 1
        end

        all_word_counts[:standard_words][word] += 1
      end
    end

    all_word_counts
  end

end

