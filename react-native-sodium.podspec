require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/lyubo/react-native-sodium.git", :tag => "v#{s.version}" }
  s.source_files = "ios/**/*.{h,m,mm}", "cpp/**/*.{h,cpp}"

  # s.vendored_libraries = 'libsodium/libsodium-ios/lib/libsodium.a'
  s.vendored_frameworks = "libsodium/build/libsodium-apple/Clibsodium.xcframework"
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/Headers/Public/#{s.name}/**'}

  s.dependency 'React'
end
