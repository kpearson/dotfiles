# Fast way to configure database for :development and :test

# 1. Install appropriate system package 
# For Ubuntu/Debian:
sudo apt-get install postgresql
# or use synaptic to determine it

# 2. Configure PostgreSQL.
# This step was very hard to me, because I could not find this
# code for a long time. So, you already have this as cheatsheet


# replace "me" with your username
me@compname ~ $ sudo su postgres
[sudo] password for me:
postgres@compname /home/me $ createuser me
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) n

# Add gem to Gemfile
gem 'pg'

# If you not use guard

bundle install


# On your database.yml

development:
  adapter: postgresql
  database: mygreatappname
  pool: 5
  timeout: 5000


# Original post: http://pragtob.wordpress.com/2012/09/12/setting-up-postgresql-for-ruby-on-rails-on-linux/