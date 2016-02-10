module Languages
  module Language

    private

    def http_method
      :get
    end

    def path(params=nil)
      "/api/v1/languages/#{params[:id]}"
    end
  end
end
