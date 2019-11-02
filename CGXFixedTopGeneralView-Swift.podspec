Pod::Spec.new do |s|
s.name         = "CGXFixedTopGeneralView-Swift"    #存储库名称
s.version      = "0.7"      #版本号，与tag值一致
s.summary      = "a CGXFixedTopGeneralView-Swift 菜单封装"  #简介
s.description  = "菜单封装"  #描述
s.homepage     = "https://github.com/974794055/CGXFixedTopGeneralView-Swift"      #项目主页，不是git地址
s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
s.author             = { "974794055" => "974794055@qq.com" }  #作者
s.platform     = :ios, "8.0"                  #支持的平台和版本号
s.swift_version = "4.2"
s.source       = { :git => "https://github.com/974794055/CGXFixedTopGeneralView-Swift.git", :tag => s.version }         #存储库的git地址，以及tag值
s.requires_arc = true #是否支持ARC
s.frameworks = 'UIKit'
s.source_files  =  "CGXFixedTopGeneralView-Swift", "CGXFixedTopGeneralView-Swift/**/*.{swift}" #需要托管的源代码路径
end




