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
Clients and requests always have five optional methods that you can use to configurate requests. They are:
  1. Body: JSON request body.
  2. Path:


(Required method)



This example allows do request to an Rest API.

# Folders structure
```console
clients
  |--- posts
  |     |--- post.rb # One post
  |     |--- posts.rb # All post
  |
  |--- post_client.rb # Client
```

# Clients
We suggest that you put these classes in `app/clients. Clients have to inherit from cool_http. They allows 

# Request
