require "fileutils"

service = File.join(File.dirname(__FILE__), "build/Release/GistService.service")

desc "Install for this user"
task :install => :build do
  sh "mkdir -p ~/Library/Services"
  sh "cp -r #{service.inspect} ~/Library/Services"
end

desc "Install for all users"
task :install_all => :build do
  FileUtils.cp_r(service, "/Library/Services/")
end

desc "Build"
task :build do
  sh "xcodebuild"
end