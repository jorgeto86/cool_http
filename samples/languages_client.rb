class LanguagesClient < CoolHttp

  def url
    "http://localhost:3000"
  end
end

# LanguagesClient.new(:language).perform(id: 1)
# LanguagesClient.new(:languages).perform
