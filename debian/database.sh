

# run as postgres user
# see this post :http://jacobian.org/writing/pg-encoding-ubuntu/
pg_dropcluster --stop 8.4 main
pg_createcluster --start -e UTF-8 8.4 main


sudo vi /etc/postgresql/8.4/main/pg_hba.conf
# "local" is for Unix domain socket connections only
local   all         all                               trust
# IPv4 local connections:
host    all         all         127.0.0.1/32          trust
# IPv6 local connections:
host    all         all         ::1/128               trust

sudo /etc/init.d/postgresql restart

createdb development_db
createdb testing_db
createuser transiki
psql development_db
#in there run this command: alter user transiki with password 'transiki';


