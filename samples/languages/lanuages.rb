module Languages
  module Languages

    private

    def http_method
      :get
    end

    def url
      "http://localhost:3000"
    end

    def path(params=nil)
      '/api/v1/languages/'
    end
  end
end


class LanguagesClient < CoolHttp
end

LanguagesClient.new(:languages).perform
