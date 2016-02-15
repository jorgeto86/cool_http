Gem::Specification.new do |s|
  s.name        = 'cool_http'
  s.version     = '1.0'
  s.date        = '2016-02-08'
  s.summary     = "HTTP client with encapsulated requests"
  s.description = "HTTP client with encapsulated requests"
  s.authors     = ["Jorge Salcedo"]
  s.email       = 'jorgeto86@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = ''
  # s.require_paths = ["lib"]

  s.add_development_dependency "faraday",  '~> 0.9.2'
end
