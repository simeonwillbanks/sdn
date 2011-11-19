namespace :moment do
  desc 'create moment type via rake moment:create[Name] -args'
  # List of steps taken to create a song:
  #
  task :create, :name do |cmd, args|
    puts "command: #{cmd}"
    puts "args: #{args.inspect}"
    # command: moment:create
    # args: {:name => 'Name'}
  end
end
