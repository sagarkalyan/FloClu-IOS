 # Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

platform :ios, '12.2'

target 'FloClu' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FloClu
  pod 'Firebase/Analytics'
  pod 'Firebase'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'Firebase/Firestore' 
  pod 'GoogleSignIn'
  pod 'Firebase/Messaging'
  pod 'Firebase/Database'
  pod 'JTAppleCalendar'

 post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'JTAppleCalendar'
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end
 end

  
end


