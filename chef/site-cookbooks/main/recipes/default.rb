# Add GATech Ubuntu package mirror to get runit package
# http://packages.ubuntu.com/lucid/amd64/runit/download
apt_repository "gatech" do
  uri "http://www.gtlib.gatech.edu/pub/ubuntu/"
  distribution "lucid"
  components ["main", "universe"]
end

# Add Security Ubuntu package mirror to get nginx package
# http://packages.ubuntu.com/lucid/amd64/nginx/download
apt_repository "security" do
  uri "http://security.ubuntu.com/ubuntu"
  distribution "lucid-security"
  components ["main", "universe"]
end
