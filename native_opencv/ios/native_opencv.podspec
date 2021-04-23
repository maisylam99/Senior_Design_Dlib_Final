Pod::Spec.new do |s|
  s.name             = 'native_opencv'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.static_framework = true
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '14.4'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'


  # telling CocoaPods not to remove framework
  s.preserve_paths = 'opencv2.framework'

  # telling linker to include opencv2 framework
  s.xcconfig = {
    'OTHER_LDFLAGS' => '-framework opencv2 -v'
        #'USER_HEADER_SEARCH_PATHS' => '"${PROJECT_DIR}/.."/',
        #"LIBRARY_SEARCH_PATHS" => '"${PROJECT_DIR}/.."/*',
        }


  # including OpenCV framework
  s.vendored_frameworks = 'opencv2.framework'


  # including native framework
  s.frameworks = 'AVFoundation'

  # including C++ library
  s.library = 'c++'


  #Attempting Dlib Replacement Code

  #s.public_header_files = 'DlibLibrary/dlib/*'
  #s.preserve_paths = 'opencv2.framework, DlibLibrary'
  #s.xcconfig = {
  #    'OTHER_LDFLAGS' => '-framework opencv2 -ldib'
  #        'USER_HEADER_SEARCH_PATHS' => '"${PROJECT_DIR}/.."/',
  #        "LIBRARY_SEARCH_PATHS" => '"${PROJECT_DIR}/.."/*',
  #        }
  #s.vendored_libraries = 'libdlib'

end