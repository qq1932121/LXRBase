#
# Be sure to run `pod lib lint LXRBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

    s.name             = 'LXRBase'  # 工程的名字（pod search 搜索的关键词,一定要和.podspec的名称一样，否则报错）
    s.version          = '0.1.2'    # 工程的版本控制（默认0.1.0版本），控制公共库的下载，必须和tag的版本保持一致（稍后提到）
    s.summary          = 'LXRBase' # 项目的概要（简介），最好修改下，否则pod验证时可能报错

    # 项目的描述，是概要的扩展。注意：这里的结构不可变，
    # 只能在TODO那一行增加东西，否则报错（注意s.description 文字书写格式)
    # 这里的文字的长度，一定要比上面的s.summary长，不然会认为格式不合格
    s.description      = <<-DESC
    LXRBase Swift语言 基类库
    DESC
    # 项目主页地址，GitHub上的公共库地址,注意不带后缀.git（必须为可以链接到的页面）.
    # .podspec文件中的homepage和source不支持ssh协议地址，所以我们得放入http/https地址。
    s.homepage         = 'https://github.com/qq1932121/LXRBase'



    s.license          = { :type => 'MIT', :file => 'LICENSE' }   # 开源协议，模板创建的不用改动
    s.author           = { 'qq1932121' => '1932121@qq.com' }      # 作者信息，不用改动
    # 这个很关键，指的就是git的对应的远程仓库的地址以及版本号，版本号直接获取的是上面的s.version（带.git，
    # 这里不支持ssh的地址，验证不通过，只支持HTTP和HTTPS，最好使用HTTPS），tag是公共库的版本号
    s.source           = { :git => 'https://github.com/qq1932121/LXRBase.git', :tag => s.version.to_s }

    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'# 多媒体介绍地址
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'

    s.ios.deployment_target = '8.0'   # 支持的平台及最低依赖版本
    s.requires_arc = true             # 是否使用ARC，如果指定具体文件，则具体的问题使用ARC

    # 设置子目录，如果需要在项目中分组显示，这里也要做相应的设置
    # 因为我们封装的一段代码，可能是由好几段之间没有联系的代码拼起来的
    s.source_files = 'LXRBase/Classes/**/*'

    # 图片资源地址
    # s.resource_bundles = {
    #   'LXRBaseDemo' => ['LXRBaseDemo/Assets/*.png']
    # }

    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
