module Comments
  module Update

    private

    def http_method
      :patch
    end

    def path(params=nil)
      "/comments/#{params[:id]}"
    end

    def body(params=nil)
      {
        name: params[:name]
      }
    end
  end
end
