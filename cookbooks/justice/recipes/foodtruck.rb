### Set Time Zone
# Execute local script to activate windows
batch 'x_time_zone' do
  code <<-EOH
    tzutil /s "Central Standard Time"
    EOH
end

# Create local directory for scripts
directory 'c:\scripts' do
  action :create
end
directory 'c:\scripts\soft-deploy' do
  action :create
end
directory 'c:\scripts\soft-deploy\Misc' do
  action :create
end

# Download install files
remote_file 'C:\scripts\soft-deploy\Misc\reader.exe' do
  source 'https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/1901220034/AcroRdrDC1901220034_en_US.exe'
  action :create
end
remote_file 'C:\scripts\soft-deploy\Misc\firefox_install.exe' do
  source 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/67.0/win32/en-US/Firefox%20Setup%2067.0.exe'
  action :create
end
remote_file 'C:\scripts\soft-deploy\Misc\googlechromestandaloneenterprise.msi' do
  source 'https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BE7B21965-82C7-DE66-7CFF-27582EEC1600%7D%26lang%3Den%26browser%3D4%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dtrue%26ap%3Dstable-arch_x86-statsdef_0%26brand%3DGCEA/dl/chrome/install/googlechromestandaloneenterprise.msi'
  action :create
end
# Java must be manually downloaded
# #remote_file 'C:\scripts\soft-deploy\Misc\java.exe' do
#  source 'http://sdlc-esd.oracle.com/ESD6/JSCDL/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jre-8u151-windows-i586.exe?GroupName=JSC&FilePath=/ESD6/JSCDL/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jre-8u151-windows-i586.exe&BHost=javadl.sun.com&File=jre-8u151-windows-i586.exe&AuthParam=1515172907_1b94ae39df0e902d5a6c6ff01ef032c1&ext=.exe'
#  action :create
#end
remote_file 'C:\scripts\soft-deploy\Misc\vnc.msi' do
  source 'https://www.tightvnc.com/download/2.8.11/tightvnc-2.8.11-gpl-setup-32bit.msi'
  action :create
end

