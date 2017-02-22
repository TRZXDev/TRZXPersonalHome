Pod::Spec.new do |s|
    s.name         = "TRZXPersonalHome"
    s.version      = "0.0.1"
    s.ios.deployment_target = '8.0'
    s.summary      = "TRZXPersonalHome"
    s.homepage     = "https://github.com/TRZXDev"
    s.license              = { :type => "MIT", :file => "FILE_LICENSE" }
    s.author             = { "bicassos" => "383929022@qq.com" }
    s.source       = { :git => "https://github.com/TRZXDev/TRZXPersonalHome.git", :tag => s.version }
    s.source_files  = "TRZXPersonalHome/TRZXPersonalHome/*.{h,m}"
    
    s.requires_arc = true
end