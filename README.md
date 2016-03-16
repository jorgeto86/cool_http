# Cool HTTP

## Installation
```ruby
gem 'cool_http', github: 'jorgeto86/cool_http'
```

## Clients and Requests
The client is encapsulated in a class. Requests are encapsulated in modules.
Declared methods in a client will be used in all requests. However, declare methos in modules
will be used only for his corresponding request.

### Required method:

1. url
2. http_method

### Optional methods that you can use to configurate requests:

1. body
2. path
3. query
4. connection_options

### Folders structure example
We suggest the clients and modules should be in `app/clients`.

```console
# For example:
app
  |
  clients
    |--- comments
    |     |--- comments.rb # All comments
    |     |--- delete.rb # Delete a comment
    |     |--- new.rb # Create a comment
    |     |--- show.rb # Show a comment
    |     |--- update.rb # Update a comment
    |
    |--- comments_client.rb # Comments client
```

## Usage

This example allows do test requests to a Rest API (http://jsonplaceholder.typicode.com/).

### Creating requests

```ruby
# Comments client. Clients have to inherit from cool_http
class CommentsClient < CoolHttp

  # This url will be use for all request because it is declared in client but
  # you can use a different url for a request declaring url method in the request module.
  def url
    "http://jsonplaceholder.typicode.com"
  end

  # This path will be use for all request least show request. This is because
  # show has his own path.
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
        name: params[:name],
        email: params[:email],
        body: params[:body]
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

    # This path is only used to show request
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

### Requesting
To do a request, creates a client object with module corresponding to the request
and call `perform` method. This accepts 3 params.

1. path_params: It is a hash with path params.
2. body_params: It is a hash with body params.
3. query_params: It is a hash with query params.

```ruby
CommentsClient.new(:comments).perform

path_params = { id: 1 }
CommentsClient.new(:show).perform(path_params)

path_params = { id: 1 }
body_params = {name: 'test'
CommentsClient.new(:update).perform(path_params, body_params)

body_params = { name: 'test', email: 'test@test.com', body: 'hola' }
CommentsClient.new(:new).perform(nil, body_params)

path_params = { id: 1 }
CommentsClient.new(:delete).perform(path_params)

```

