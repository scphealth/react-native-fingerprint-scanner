require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name'].gsub('@scp/', '')
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platform     = :ios, "9.0"

  s.source          = { :path => __dir__, :tag => "v#{s.version}" }
  s.source_files    = 'ios/**/*.{h,m}'
  s.preserve_paths  = '**/*.js'
  s.framework       = 'LocalAuthentication'

  s.dependency 'React'
end
