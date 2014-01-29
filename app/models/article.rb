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

  # after_create :parse_site_text
end

def parse_site_text
  site_text.split('.').each do |sentence|

    begin
      sentences << Sentence.create!(sentence_text: sentence.strip)
    rescue Exception => e
      puts e.message
    end
  end
end