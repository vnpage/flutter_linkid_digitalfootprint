#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_linkid_digitalfootprint.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_linkid_digitalfootprint'
  s.version          = '1.0.24'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'
  
#  s.dependency 'SpeedcheckerSDK'
  s.preserve_paths = 'LinkIdDigitalFootprint.xcframework/**/*'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework LinkIdDigitalFootprint' }
  s.vendored_frameworks = 'LinkIdDigitalFootprint.xcframework'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
