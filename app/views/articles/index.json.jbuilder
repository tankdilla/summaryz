json.array!(@articles) do |article|
  json.extract! article, :url, :site_text, :author, :headline, :posted_by, :posted_on
  json.url article_url(article, format: :json)
end
