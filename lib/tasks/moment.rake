namespace :moment do
  desc 'create moment type via rake moment:create[Name] -args'
  # List of steps taken to create a song:
  #
  # rails g resource Song title:string artist:string listen:string --assets=false --view-specs=false
  #   Figure out how to exclude generated helper or just delete it after its generated
  # Name inherits from DefaultScope
  # Name include Momentable
  # Name Spec has empty context for validations
  # Name Spec sets moment type and has context for behaves like moment
  # Name Controller Spec moment type set and include_context 'moment'
  # Name Controller inherit from InhertitedResources and include MomentsApi
  # Update moments route rule to include new moment type
  # touch app/views/names/_name.html.haml
  # rails generate draper:decorator Name
  # Add Scenario to Home page feature for moment type
  # Update comment controller to add belongs_to :name
  # Add Comment scenarios for moment type to moment comment feature
  # Add moment creation scenarios for moment type to comment creation feature
  # Add moment tags scenarios for moment type to tags feature
  # Add moment display scenarios for moment type to display feature
  task :create, :name do |cmd, args|
    puts "command: #{cmd}"
    puts "args: #{args.inspect}"
    # command: moment:create
    # args: {:name => 'Name'}
  end
end
