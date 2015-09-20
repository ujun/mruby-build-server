r = Apache::Request.new()

# store the sent mruby_config.rb to /var/www/html/mruby  
File.open("/var/www/html/mruby/build_config.rb", "w") do |file|
  file.write(r.body.to_s)
end

# build mruby 
`cd /var/www/html/mruby; rake`

# set values in libmruby.flags.mak to response headers
File.open("/var/www/html/mruby/build/host/lib/libmruby.flags.mak") do |file|
  reg = Regexp.compile("([^=]+)\s=(.*)\n")
  file.each do |line|
    if reg =~ line
      r.headers_out[$1] = $2
    end
  end
end

# return the generated static library
r.filename = "/var/www/html/mruby/build/host/lib/libmruby.a"

Apache.return(Apache::OK)
