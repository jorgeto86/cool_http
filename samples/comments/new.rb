module Comments
  module New

    private

    def http_method
      :post
    end

    def body(params=nil)
      {
        postId: 1,
        name: "test",
        email: "test@gardner.biz",
        body: "hola"
      }
    end
  end
end
