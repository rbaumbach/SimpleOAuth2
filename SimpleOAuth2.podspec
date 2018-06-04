Pod::Spec.new do |s|
  s.name                  = 'SimpleOAuth2'
  s.version               = '0.1.4'
  s.summary               = 'A Simple OAuth2 Helper.'
  s.homepage              = 'https://github.com/rbaumbach/SimpleOAuth2'
  s.license               = { :type => 'MIT', :file => 'MIT-LICENSE.txt' }
  s.author                = { 'Ryan Baumbach' => 'github@ryan.codes' }
  s.source                = { :git => 'https://github.com/rbaumbach/SimpleOAuth2.git', :tag => s.version.to_s }
  s.requires_arc          = true
  s.platform              = :ios
  s.ios.deployment_target = '8.0'
  s.public_header_files   = 'SimpleOAuth2/Source/SimpleOAuth2.h', 'SimpleOAuth2/Source/SimpleOAuth2AuthenticationManager.h',
                            'SimpleOAuth2/Source/NSURLRequest+SimpleOAuth2.h', 'SimpleOAuth2/Source/TokenParameters.h'
  s.source_files          = 'SimpleOAuth2/Source/*.{h,m}'

  s.dependency 'AFNetworking', '>= 3.0.0'
end
