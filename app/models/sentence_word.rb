class SentenceWord
  include Mongoid::Document
  field :vote
  field :word_text
  field :word_type
  field :count

  embedded_in :sentence

end