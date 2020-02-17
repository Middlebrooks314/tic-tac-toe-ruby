# frozen_string_literal: true

task default: %w[test]

task :test do
  sh 'bundle exec rspec'
end

task test: :rubocop

task :rubocop do
  sh 'rubocop'
end
