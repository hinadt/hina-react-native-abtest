
Pod::Spec.new do |s|
  s.name         = "RNHinaReactNativeAbtest"
  s.version      = "1.0.0"
  s.summary      = "The official React Native SDK of HinaABTesting."
  s.description  = <<-DESC
                  海纳嗨数 RN 组件 abtest
                   DESC
  s.homepage     = "https://hicloud.hinadt.com"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/hinadt/hina-react-native-abtest.git" }
  # s.source_files  = "RNHinaReactNativeAbtest/**/*.{h,m}"
  s.source_files = "ios/*.{h,m}"
  s.requires_arc = true
  s.dependency "React"
  s.dependency "HinaABTesting", ">= 0.0.5"

end

  