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

This example allows do test requests to a Rest API (http://jsonplaceholder.typicode.com/)

```ruby
class CommentsClient < CoolHttp

  def url
    "http://jsonplaceholder.typicode.com"
  end

  def path(params=nil)
    "/comments/"
  end
end

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

module Comments
  module Comments

    private

    def http_method
      :get
    end
  end
end
```
