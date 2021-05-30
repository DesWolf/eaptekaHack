platform :ios, ‘13.0’

use_frameworks!

target ‘EaptekaHack’ do
	
	# Codestyle
	pod 'SwiftLint'
	
	# Analyticsß
	
	# DI
	pod 'Swinject'
	pod 'SwinjectStoryboard', :git => 'https://github.com/Swinject/SwinjectStoryboard.git', :commit => '0ca45c83a8aa398c153d8a036c95abb4343cfa0c'

	
	# Networking
	pod 'Alamofire'
	pod 'SwiftyJSON'


	#Auth
	pod 'Firebase/Auth'
	pod 'GoogleSignIn'
	pod 'FBSDKCoreKit'  
	pod 'FBSDKLoginKit'
	
	# Data Storage
	pod 'Firebase/Database'

	
	# UI
	pod 'SnapKit'

		
	# Other
	
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
