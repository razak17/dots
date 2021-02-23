sudo -iu postgres
initdb -D /var/lib/postgres/data
initdb --locale=en_US.UTF-8 -E UTF8 -D /var/lib/postgres/data

createuser --interactive
createdb myDatabaseName

sudo systemctl start docker.service
sudo systemctl enable postgresql.service

