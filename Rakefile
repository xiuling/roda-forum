task default: %w[test]

task :test do
  ENV['RACK_ENV'] = 'test'
  Dir.glob('./specs/**/*_spec.rb').each {|f| require f }
end
