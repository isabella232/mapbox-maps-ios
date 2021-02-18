Pod::Spec.new do |m|

  maps_version = '10.0.0-beta.13'

  m.name = 'MapboxMaps'
  m.version = maps_version

  m.summary = 'Vector map solution for iOS with full styling capabilities.'
  m.description = 'Metal-based vector map solution for iOS with full styling capabilities.'
  m.homepage = 'https://docs.mapbox.com/ios/beta/maps/guides/'
  m.license = { type: 'Commercial', file: 'LICENSE.md' }
  m.author = { 'Mapbox' => 'mobile@mapbox.com' }
  m.social_media_url = 'https://twitter.com/mapbox'
  m.documentation_url = 'https://docs.mapbox.com/ios/beta/maps/api-reference/'
  
  m.source = { :git => 'https://github.com/mapbox/mapbox-maps-ios.git', :tag => 'v10.0.0-beta.13' }
  m.platform = :ios
  m.ios.deployment_target = '11.0'
  m.swift_version = '5.3'
  m.requires_arc = true
  m.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  m.source_files = 'Mapbox/MapboxMaps/**/*.{swift,h}', 'Mapbox/MapboxMapsAnnotations/**/*.{swift,h}', 'Mapbox/MapboxMapsFoundation/**/*.{swift,h}', 'Mapbox/MapboxMapsGestures/**/*.{swift,h}', 'Mapbox/MapboxMapsLocation/**/*.{swift,h}', 'Mapbox/MapboxMapsOffline/**/*.{swift,h}', 'Mapbox/MapboxMapsOrnaments/**/*.{swift,h,strings}', 'Mapbox/MapboxMapsSnapshot/**/*.{swift,h}', 'Mapbox/MapboxMapsStyle/**/*.{swift,h}'
  m.resources = 'Mapbox/MapboxMapsLocation/Pucks/IndicatorAssets.xcassets'

  m.dependency 'MapboxCoreMaps', '10.0.0-beta.14.1'
  m.dependency 'MapboxCommon', '10.0.0-beta.9.1'
  m.dependency 'MapboxMobileEvents', '0.10.7'
  m.dependency 'Turf', '1.2.0'

end
