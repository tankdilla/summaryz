class SentenceWord
  include Mongoid::Document
  field :vote
  field :word_text

  embedded_in :sentence

end