module Comments
  module New

    private

    def http_method
      :post
    end

    def body(params=nil)
      {
        postId: 1,
        name: params[:name],
        email: params[:email],
        body: params[:body]
      }
    end
  end
end
