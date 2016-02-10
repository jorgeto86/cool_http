class CoolHttp

  def initialize(action)
    self.extend(module_name(action))
  end

  def perform(path_params=nil, body_params=nil)
    response = connection.send(http_method) do |request|
      request.url path(path_params)
      request.body = body(body_params).to_json
    end.body
    JSON.parse response
  end

private

  def body(params)
  end

  def connection_options
    {}
  end

  def connection
    @connection ||= Faraday.new(default_connection_options)
  end

  def default_connection_options
    {
      url: url,
      headers: {
        content_type: 'application/json',
        accept: 'application/json'
      }
    }.merge(connection_options)
  end

  def module_name(action)
    "#{self.class.name.to_s.gsub('Client', '')}::#{action.to_s.camelize}".constantize
  end
end
