options = {
  url:      "http://api.rottentomatoes.com"
}

ROTTENTOMATOES = Faraday::Connection.new(options) do |builder|
  builder.use Faraday::Request::Multipart
  builder.use Faraday::Request::UrlEncoded
  builder.adapter Faraday.default_adapter
end
