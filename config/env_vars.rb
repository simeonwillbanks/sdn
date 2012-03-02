# encoding: utf-8
# Read env vars from shell script and load them into ruby process
env_vars = File.expand_path(File.dirname(__FILE__) + '/../chef/.bash_environment_variables')
File.open(env_vars, 'r') do |f|
  f.each do |line|
    /([A-Z_]+[^=])=(.*)/.match(line) do |match|
      ENV[match[1]] = match[2]
    end
  end
end if File.exists?(env_vars)
