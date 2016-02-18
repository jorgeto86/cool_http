require 'faraday'

class CoolHttp
  NO_BODY = nil
  NO_PATH = ''
  EMPTY = {}

  def initialize(action)
    extend(module_name(action))
  end

  def perform(path_params=nil, body_params=nil, query_params=nil)
    response = connection.send(http_method) do |request|
      request.url path(path_params), query(query_params)
      request.body = body(body_params).to_json
    end
    JSON.parse response.body
  end

private

  def body(params)
    EMPTY
  end

  def path(params)
    NO_PATH
  end

  def query(params)
    EMPTY
  end

  def connection_options
    EMPTY
  end

  def connection
    @connection ||= Faraday.new(default_connection.merge(connection_options))
  end

  def default_connection
    {
      url: url,
      headers: {
        content_type: 'application/json',
        accept: 'application/json'
      }
    }
  end

  def module_name(action)
    "#{self.class.name.to_s.gsub('Client', '')}::#{action.to_s.camelize}".constantize
  end
end
