module Languages
  module Languages

    private

    def http_method
      :get
    end

    def path(params=nil)
      '/api/v1/languages/'
    end
  end
end
