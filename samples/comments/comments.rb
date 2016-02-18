module Comments
  module Comments

    private

    def http_method
      :get
    end

    def path(params=nil)
      "/comments"
    end
  end
end
