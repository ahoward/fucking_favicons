## fucking_favicons.gemspec
#

Gem::Specification::new do |spec|
  spec.name = "fucking_favicons"
  spec.version = "1.0.0"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "fucking_favicons"
  spec.description = "fucking favicons fucking suck"
  spec.license = "same as ruby's"

  spec.files =
["README.md",
 "Rakefile",
 "lib",
 "lib/fucking_favicons",
 "lib/fucking_favicons.rb",
 "lib/fucking_favicons/app",
 "lib/fucking_favicons/app/assets",
 "lib/fucking_favicons/app/assets/images",
 "lib/fucking_favicons/app/assets/images/favicon.png",
 "lib/fucking_favicons/app/views",
 "lib/fucking_favicons/app/views/fucking_favicons.html.erb",
 "lib/fucking_favicons/middleware.rb",
 "lib/fucking_favicons/rails.rb",
 "lib/fucking_favicons/version.rb"]

  spec.executables = []
  
  spec.require_path = "lib"

  spec.test_files = nil

  
    spec.add_dependency(*["mini_magick", " >= 3.1"])
  

  spec.extensions.push(*[])

  spec.rubyforge_project = "codeforpeople"
  spec.author = "Ara T. Howard"
  spec.email = "ara.t.howard@gmail.com"
  spec.homepage = "https://github.com/ahoward/fucking_favicons"
end
