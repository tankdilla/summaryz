class ProperNoun
  include Mongoid::Document
  field :term, type: String
  field :count, type: Integer

  embedded_in :article
end
