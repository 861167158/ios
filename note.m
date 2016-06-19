// ========================================
// 安装cocoapds
// 参考地址 https://ruby.taobao.org/
// ========================================
ruby -v
// 查看所有资源
gem sources -l
// 删除资源
gem sources -r https://rubygrems.org/
// 添加资源
gem sources -a https://ruby.taobao.org
// 更新资源缓存
gem sources -u

// 使用
vim podfile

platform :ios,'8.1'
pod AFNetworking
pod MBrocessHUB '!>0.8'

pod install


