# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
    pod 'SwiftLint'
end

target 'MarsRover' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  common_pods

  # Pods for MarsRover

  target 'MarsRoverTests' do
    inherit! :search_paths
    common_pods
    # Pods for testing
  end

  target 'MarsRoverUITests' do
    inherit! :search_paths
    common_pods
    # Pods for testing
  end

end
