class CommentsClient < CoolHttp

  def url
    "http://jsonplaceholder.typicode.com"
  end
end


# LanguagesClient.new(:language).perform(id: 1)
# LanguagesClient.new(:languages).perform(nil, nil, test: 'hola')
