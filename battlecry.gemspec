spec = Gem::Specification.new do |s|
	s.name = 'battlecry'
	s.version = '0.1'
	s.date = '2010-06-16'
	s.summary = 'A simple abstraction for sydicating messages to OSX hosts via Growl'
	s.email = 'dan.simpson@gmail.com'
	s.homepage = 'http://github.com/dansimpson/battlecry'
	s.description = 'A simple abstraction for sydicating messages to OSX hosts via Growl'
	s.has_rdoc = true
	
	s.authors = ['Dan Simpson']
	s.add_dependency('ruby-growl', '>= 2.0')

	s.files = [
	  'README.markdown',
	  'battlecry.gemspec',
	  'Rakefile',
    'spec/helper.rb',
    'spec/battlecry_spec.rb',
    'lib/battlecry.rb'
	]
end
