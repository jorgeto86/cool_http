module Comments
  module Show

    private

    def http_method
      :get
    end

    def path(params=nil)
      "/comments/#{params[:id]}"
    end

  end
end
