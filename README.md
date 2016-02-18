(Working at...)

# Cool HTTP

## Installation
```ruby
gem 'cool_http', github: 'jorgeto86/cool_http'
```

Add in application.rb the autoload_paths confguration:
```ruby
module MyApp
  class Application < Rails::Application

    # Add this line for custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += Dir["#{config.root}/lib/*/"] + Dir["#{config.root}/lib"]
  end
end
```

## Clients and Requests
The client is encapsulated in a class. Requests are encapsulated in modules.
Declared methods in a client are all requests. However, declare methos in modules
are only for his corresponding request.

### Required method:

1. url
2. http_method

### Optional methods that you can use to configurate requests:

1. body
2. path
3. query
4. connection_options

### Folders structure example
We suggest that you put these classes in `app/clients`.
```console
clients
  |--- posts
  |     |--- comments.rb # All comments
  |     |--- new.rb # Create a comment
  |     |--- show.rb # Show a comment
  |
  |--- comments_client.rb # Comments client
```

This example allows do test requests to a Rest API (http://jsonplaceholder.typicode.com/).

```ruby
# Comments client. Clients have to inherit from cool_http
class CommentsClient < CoolHttp

  # This url will be use for all request because it is declared in client.
  def url
    "http://jsonplaceholder.typicode.com"
  end

  # This path will be use for all request least show request. This is because
  # show has his own path
  def path(params=nil)
    "/comments/"
  end
end

# Request to create a comment
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

# Request to show a comment
module Comments
  module Show

    private

    def http_method
      :get
    end

    # Path only to show request
    def path(params=nil)
      "/comments/#{params[:id]}"
    end

  end
end

# Request for all comments
module Comments
  module Comments

    private

    def http_method
      :get
    end
  end
end
```
