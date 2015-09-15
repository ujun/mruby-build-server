r = Apache::Request.new()

# store the sent mruby_config.rb to /var/www/html/mruby  
File.open("/var/www/html/mruby/build_config.rb", "w") do |file|
  file.write(r.body.to_s)
end

# build mruby 
`cd /var/www/html/mruby; rake`

# return the generated static library
r.filename = "/var/www/html/mruby/build/host/lib/libmruby.a"

Apache.return(Apache::OK)
