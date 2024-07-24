# Mysql

This project involved learning how to configure database servers in a
primary-replica model. I configured the two servers provided to me by
ALX in a MySQL primary-replica setup with a dummy database, and wrote
a Bash script to automate generation of database backups.

## Tasks :
## 4. Setup a Primary-Replica infrastructure using MySQL
Having a replica member on for your MySQL database has 2 advantages:

- *Redundancy*: If you lose one of the database servers, you will still have another working one and a copy of your data
- *Load distribution*: You can split the read operations between the 2 servers, reducing the load on the primary member and improving query response speed

* [4-mysql_configuration_primary](./4-mysql_configuration_primary): The MySQL
`my.conf` configuration file used to set up my first server as a primary database
server on the database `tyrell_corp`.

* [4-mysql_configuration_replica](./4-mysql_configuration_replica): The MySQL
`my.conf` configuration file used to set up my second server as the replica
database server on the database `tyrell_corp`.

![Primary-Replica](https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/09e83e914f0d6865ce320a47f2f14837a5b190b6.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20240724%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240724T031629Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=a5f1affdc3ab4c42af4f948024fbba9558aae78a7f8cceee3babf34ad69c910b)

* Steps
-------------------------------------------
setting up MySQL replication between web-01 (primary) and web-02 (replica) for the tyrell_corp database. Here's how to configure both servers:

For web-01 (Primary):

1. Edit the MySQL configuration file:

   ```
   sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
   ```

2. Make the following changes:

   ```ini
   [mysqld]
   pid-file        = /var/run/mysqld/mysqld.pid
   socket          = /var/run/mysqld/mysqld.sock
   datadir         = /var/lib/mysql
   log-error       = /var/log/mysql/error.log
   # By default we only accept connections from localhost
   # bind-address  = 127.0.0.1
   server-id       = 1
   log_bin         = /var/log/mysql/mysql-bin.log
   binlog_do_db    = tyrell_corp
   ```

   Note: comment out the bind-address line and added server-id, log_bin, and binlog_do_db.

3. Save the file.

4. Restart MySQL:

   ```
   sudo systemctl restart mysql
   ```

5. Enter MySQL and grant replication privileges to replica_user:

   ```sql
   sudo mysql
   GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
   FLUSH PRIVILEGES;
   ```

6. Get the binary log position:

   ```sql
   SHOW MASTER STATUS;
   ```

   Note down the File and Position values.

For web-02 (Replica):

1. Edit the MySQL configuration file:

   ```
   sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
   ```

2. Make the following changes:

   ```ini
   [mysqld]
   pid-file        = /var/run/mysqld/mysqld.pid
   socket          = /var/run/mysqld/mysqld.sock
   datadir         = /var/lib/mysql
   log-error       = /var/log/mysql/error.log
   # By default we only accept connections from localhost
   # bind-address  = 127.0.0.1
   server-id       = 2
   relay-log       = /var/log/mysql/mysql-relay-bin.log
   log_bin         = /var/log/mysql/mysql-bin.log
   binlog_do_db    = tyrell_corp
   ```

3. Save the file and restart MySQL:

   ```
   sudo systemctl restart mysql
   ```

4. Enter MySQL and set up the replication:

   ```sql
   sudo mysql
   CHANGE MASTER TO
   MASTER_HOST='web-01_ip_address',
   MASTER_USER='replica_user',
   MASTER_PASSWORD='your_password_here',
   MASTER_LOG_FILE='mysql-bin.000001',
   MASTER_LOG_POS=123;
   ```

   Replace 'web-01_ip_address', 'your_password_here', 'mysql-bin.000001', and 123 with the actual values from your primary server.

5. Start the slave process:

   ```sql
   START SLAVE;
   ```

6. Check the slave status:

   ```sql
   SHOW SLAVE STATUS\G
   ```

   Look for "Slave_IO_Running" and "Slave_SQL_Running". Both should be "Yes".

### UFW Configuration:

On web-01, allow incoming connections on port 3306:

```
sudo ufw allow from web-02_ip_address to any port 3306
```

Replace web-02_ip_address with the actual IP address of web-02.

To test the replication:

1. On web-01, add a new record to the tyrell_corp.nexus6 table.
2. On web-02, check if the new record appears in the same table.


**NOTE** Replace placeholders (like IP addresses, passwords, and log file names) with your actual values. This setup should give you a working MySQL primary-replica replication for the tyrell_corp database.


## 5. MySQL backup

* [5-mysql_backup](./5-mysql_backup): Bash script that generates a compressed
`tar.gz` archive from a MySQL dump.
  * Usage: `./5-mysql_backup <MySQL root password>`
  * Generates a dump containing all MySQL databases on the root server.
  * Names the resulting tar archive in the format `day-month-year.tar.gz`.