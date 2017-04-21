Pod::Spec.new do |s|

  s.name         = "Logg"
  s.version      = "0.9.2"
  s.summary      = "A logging framework for swift"

  s.homepage     = "https://github.com/JuanjoArreola/Logg"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Juanjo Arreola" => "juanjo.arreola@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/JuanjoArreola/Logg.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "Sources/*.swift"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # s.requires_arc = true

end
