class CommentsClient < CoolHttp

  def url
    "http://jsonplaceholder.typicode.com"
  end

  def path(params=nil)
    "/comments/"
  end
end
