Pod::Spec.new do |spec|

  spec.name         = 'ExtensionCommon'
  spec.version      = '1.2.6'
  spec.summary      = 'Useful extension Swift function'
  spec.description  = 'The framework created to support developer with many useful extension function'

  spec.homepage     = 'https://github.com/cuongpham31797/ExtensionCommon.git'

  spec.license      = 'MIT'

  spec.author             = { 'Cuong Pham' => 'kuongfam31797@gmail.com' }
  
  spec.platform     = :ios, '14.0'

  spec.source       = { :git => 'https://github.com/cuongpham31797/ExtensionCommon.git', :tag => '1.2.2' }

  spec.source_files  = 'ExtensionCommon/**/*.swift'
  spec.swift_versions = '5.0'
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
