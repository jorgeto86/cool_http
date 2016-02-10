module Languages
  module Languages

    private

    def http_method
      :get
    end

    def path(params=nil)
      '/api/v1/languages/'
    end

    def query(params=nil)
      { params: params[:test] }
    end
  end
end
