class Article
  include Mongoid::Document
  field :url, type: String
  field :site_text, type: String
  field :author, type: String
  field :headline, type: String
  field :posted_by, type: String
  field :posted_on, type: Time
end
