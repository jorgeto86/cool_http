class CommentsClient < CoolHttp

  def url
    "http://jsonplaceholder.typicode.com"
  end

  def path(params=nil)
    "/comments/"
  end
end

# CommentsClient.new(:comments).perform
# CommentsClient.new(:show).perform(id: 1)
# CommentsClient.new(:new).perform
