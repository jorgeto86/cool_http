module Languages
  module Language

    private

    def http_method
      :get
    end

    def url
      "http://localhost:3000"
    end

    def path(params=nil)
      "/api/v1/languages/#{params[:id]}"
    end
  end
end


class LanguagesClient < CoolHttp
end

LanguagesClient.new(:language).perform(nil, id: 1)
