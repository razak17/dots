sudo -iu postgres
# initdb -D /var/lib/postgres/data
initdb --locale=en_US.UTF-8 -E UTF8 -D /var/lib/postgres/data

# normal mode
sudo systemctl enable postgresql.service
sudo systemctl start postgresql.service

touch /var/lib/postgres/.psql_history

createuser --interactive
createdb myDatabaseName

