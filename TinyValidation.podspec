Pod::Spec.new do |spec|
  spec.name = 'TinyValidation'
  spec.version = '0.3.0'
  spec.license = 'MIT'
  spec.summary = 'A fluent and elegant validation framework for Swift.'
  spec.homepage = 'https://github.com/royhsu/tiny-validation'
  spec.authors = { 'Roy Hsu' => 'roy.hsu@tinyworld.cc' }
  spec.source = { 
    :git => 'https://github.com/royhsu/tiny-validation.git', 
    :tag => spec.version
  }
  spec.framework = 'Foundation'
  spec.source_files = 'Sources/*.swift', 'Sources/**/*.swift', 'Sources/**/**/*.swift'
  spec.ios.source_files = 'Sources/iOS/*.swift'
  spec.ios.deployment_target = '10.0'
  spec.swift_version = '5.0'
  spec.dependency 'TinyCore', '0.9.0'
end
