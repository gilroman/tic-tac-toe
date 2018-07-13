require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "tests"
  t.libs << "src"
  t.test_files = FileList["tests/test_*.rb"]
end

task :default => :test
