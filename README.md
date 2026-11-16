# mysql-codespace-devcontainer

## Using codespace
To login into the database, use `mysql -u root -pmariadb -h 127.0.0.1`/
`mysql -h 127.0.0.1 -u root -pmariadb --skip-ssl`

## Using sql
mysql -h 127.0.0.1 -u root -pmariadb --skip-ssl -e "CREATE DATABASE university_db;"
Then load the file into that empty database:
mysql -h 127.0.0.1 -u root -pmariadb --skip-ssl university_db < university_setup.sql
mysql -h 127.0.0.1 -u root -pmariadb --skip-ssl university_db -e "SHOW TABLES; SELECT COUNT(*) FROM enrollments;"