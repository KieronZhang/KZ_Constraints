
Pod::Spec.new do |s|

    s.name = 'KZ_Constraints'
    s.version = '0.1.7'
    s.summary = 'iOS & macOS Constraints.'
    s.homepage = 'https://github.com/KieronZhang/KZ_Constraints'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang' => 'https://github.com/KieronZhang'}

    s.source = {:git => 'https://github.com/KieronZhang/KZ_Constraints.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.requires_arc = true

    s.ios.frameworks = 'Foundation', 'UIKit'
    s.osx.frameworks = 'Foundation', 'AppKit'

    s.ios.deployment_target = '8.0'
    s.osx.deployment_target = '10.10'

    s.ios.vendored_frameworks = 'KZ_Constraints/KZ_Constraints_iOS.framework'
    s.osx.vendored_frameworks = 'KZ_Constraints/KZ_Constraints_macOS.framework'

end
