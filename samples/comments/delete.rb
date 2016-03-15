module Comments
  module Delete

    private

    def http_method
      :delete
    end

    def path(params=nil)
      "/comments/#{params[:id]}"
    end
  end
end
