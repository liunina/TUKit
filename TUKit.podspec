Pod::Spec.new do |s|
  s.name             = 'TUKit'
  s.version          = '0.1.5'
  s.summary          = 'A short description of TUKit.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'http://nas.iliunian.com:82/apple/TUKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'i19850511@gmail.com' => 'i19850511@gmail.com' }
  s.source           = { :git => 'http://nas.iliunian.com:82/apple/TUKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.public_header_files = 'Pod/TUKit.h'
  s.source_files = 'TUKit/*.h'
  s.frameworks = 'UIKit'
  
  s.subspec 'Macro' do |ss|
	  ss.public_header_files = 'TUKit/Macro/*.h'
	  ss.source_files = 'TUKit/Macro/**/*'
  end
   
   s.subspec 'Color' do |ss|
	   ss.public_header_files = 'TUKit/Color/*.h'
	   ss.source_files = 'TUKit/Color/**/*'
   end
   
   s.subspec 'Font' do |ss|
	   ss.public_header_files = 'TUKit/Font/*.h'
	   ss.source_files = 'TUKit/Font/**/*'
   end
   
   s.subspec 'Image' do |ss|
	   ss.public_header_files = 'TUKit/Image/*.h'
	   ss.source_files = 'TUKit/Image/**/*'
   end
   
   s.subspec 'ImageView' do |ss|
	   ss.dependency 'SDWebImage'
	   ss.dependency 'TUKit/Image'
	   ss.dependency 'TUKit/Color'
	   ss.public_header_files = 'TUKit/ImageView/*.h'
	   ss.source_files = 'TUKit/ImageView/**/*'
   end
   
   s.subspec 'View' do |ss|
	   ss.dependency 'Masonry'
	   ss.dependency 'MBProgressHUD'
	   ss.dependency 'TUKit/Color'
	   ss.dependency 'TUKit/Font'
	   ss.public_header_files = 'TUKit/View/*.h'
	   ss.source_files = 'TUKit/View/**/*.{h,m}'
	   ss.resource_bundles = {
		 'TUView' => ['TUKit/View/Assets/*']
	   }
   end
   
   s.subspec 'Label' do |ss|
	   ss.public_header_files = 'TUKit/Label/*.h'
	   ss.source_files = 'TUKit/Label/**/*'
   end
   
   s.subspec 'TextView' do |ss|
	   ss.public_header_files = 'TUKit/TextView/*.h'
	   ss.source_files = 'TUKit/TextView/**/*'
   end
   
   s.subspec 'TableView' do |ss|
	   ss.dependency 'Masonry'
	   ss.public_header_files = 'TUKit/TableView/*.h'
	   ss.source_files = 'TUKit/TableView/**/*'
   end
   
   s.subspec 'CollectionView' do |ss|
	   ss.dependency 'Masonry'
	   ss.public_header_files = 'TUKit/CollectionView/*.h'
	   ss.source_files = 'TUKit/CollectionView/**/*'
   end
   
   s.subspec 'ViewController' do |ss|
	   ss.dependency 'TUKit/View'
	   ss.public_header_files = 'TUKit/ViewController/*.h'
	   ss.source_files = 'TUKit/ViewController/**/*'
   end
   
   s.subspec 'Alert' do |ss|
	   ss.dependency 'TUKit/ViewController'
	   ss.public_header_files = 'TUKit/Alert/*.h'
	   ss.source_files = 'TUKit/Alert/**/*'
   end
   
end
