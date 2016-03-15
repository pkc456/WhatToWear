platform :ios, '8.0'

use_frameworks!

target 'WhatToWear' do

    pod "Koloda"

end

post_install do |installer|
    `find Pods -regex 'Pods/pop.*\\.h' -print0 | xargs -0 sed -i '' 's/\\(<\\)pop\\/\\(.*\\)\\(>\\)/\\"\\2\\"/'`
    
end

