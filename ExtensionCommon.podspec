Pod::Spec.new do |spec|

  spec.name         = 'ExtensionCommon'
  spec.version      = '1.0.0'
  spec.summary      = 'Useful extension Swift function'
  spec.description  = 'The framework created to support developer with many useful extension function'

  spec.homepage     = 'https://github.com/cuongpham31797/ExtensionCommon.git'

  spec.license      = 'MIT'

  spec.author             = { 'Cuong Pham' => 'kuongfam31797@gmail.com' }
  
  spec.platform     = :ios, '14.0'

  spec.source       = { :git => 'https://github.com/cuongpham31797/ExtensionCommon.git', :tag => '1.0.0' }

  spec.source_files  = 'ExtensionCommon/**/*.swift'
  spec.swift_versions = '5.0'

end
