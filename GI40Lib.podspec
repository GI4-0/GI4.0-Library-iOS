Pod::Spec.new do |spec|
spec.name = 'GI40Lib'
spec.version = '1.0.1'
spec.summary = 'Library for showing patient information for medicinal products'
spec.homepage = 'https://github.com/GI4-0/GI4.0-Library-iOS/'
spec.documentation_url = 'https://github.com/GI4-0/GI4.0-Library-iOS/'
spec.source = { :git => 'https://github.com/GI4-0/GI4.0-Library-iOS/', :tag => spec.version }
spec.swift_version = '5.6.1'
spec.ios.deployment_target = '13.0'
spec.vendored_frameworks = 'Sources/GI40Lib.xcframework'
end
