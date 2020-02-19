require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: %w[test]

task :test do
  sh 'bundle exec rspec'
end

task test: :rubocop
