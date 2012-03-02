bash "create-simeon-postgres-role" do
  user 'postgres'
  code <<-EOH
  echo "CREATE ROLE SIMEON WITH CREATEDB LOGIN PASSWORD '#{node[:postgresql][:password][:simeon]}';" | psql
  EOH
  action :run
end
