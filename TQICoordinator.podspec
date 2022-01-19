#
# Be sure to run `pod lib lint TQICoordinator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TQICoordinator'
  s.version          = '1.1.0'
  s.summary          = 'Is a Base Coordinator For TQI Projects'
  
  s.homepage         = 'https://github.com/vafreitas/TQICoordinator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vafreitas' => 'vitoralves59@gmail.com' }
  s.source           = { :git => 'https://github.com/vafreitas/TQICoordinator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.source_files = 'TQICoordinator/Classes/**/*'

end
