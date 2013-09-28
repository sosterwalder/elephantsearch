package 'sqlite3'
package 'libsqlite3-dev'
package 'nodejs'

cookbook_file '/opt/nginx/conf/nginx.conf' do
  source 'nginx.conf'
end

directory '/opt/nginx/sites' do
  owner 'nobody'
  action :create
end

directory '/opt/nginx/sites/elephantsearch' do
  owner 'nobody'
  action :create
end

bash 'site installer' do
  code <<-EOH
  chown -R nobody /opt/nginx/sites/elephantsearch
  cd /opt/nginx/sites/elephantsearch
  bundle install
  EOH
end  

execute 'start nginx' do
  command '/opt/nginx/sbin/nginx'
end

