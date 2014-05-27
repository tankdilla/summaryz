class Sentence
  include Mongoid::Document
  field :vote
  field :sentence_text

  embedded_in :article

  embeds_many :sentence_words

  after_save :parse_sentence_words

  scope :upvoted, -> { where(vote: "1") }

  def parse_sentence_words
    sentence_text.gsub(/[^a-zA-Z\d]/, ' ').split(' ').each do |word|
      begin
        sentence_words << SentenceWord.new(word_text: word)
      rescue Exception => e
        puts e.message
      end
    end

    sentence_words
  end
end
