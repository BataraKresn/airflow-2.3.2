#!/bin/bash

# sudo mkdir -p /bigdata/hadoop_namenode
# sudo mkdir -p /bigdata/hadoop_datanode1
# sudo mkdir -p /bigdata/hadoop_datanode2
# sudo mkdir -p /bigdata/hadoop_datanode3
# sudo mkdir -p /bigdata/hadoop_namenager_local
# sudo mkdir -p /bigdata/hadoop_namenager_logs
# sudo mkdir -p /bigdata/hadoop_historyserver

sudo mkdir -p /home/bdata/bigdata-file/airflow/dags
sudo mkdir -p /home/bdata/bigdata-file/airflow/output
sudo mkdir -p /home/bdata/bigdata-file/airflow/plugins
sudo mkdir -p /home/bdata/bigdata-file/airflow/logs
sudo mkdir -p /home/bdata/bigdata-file/airflow/logs/scheduler
sudo mkdir -p /home/bdata/bigdata-file/postgres/data
sudo mkdir -p /home/bdata/bigdata-file/postgres/logs
sudo mkdir -p /home/bdata/bigdata-file/postgres/pgadmin_data

# sudo mkdir -p /bigdata/hue_data
# sudo mkdir -p /bigdata/spark/apps
# sudo mkdir -p /bigdata/spark/data
# sudo mkdir -p /bigdata/redis/data
# sudo mkdir -p /bigdata/hue_data
# sudo mkdir -p /bigdata/livy/target/
# sudo mkdir -p /bigdata/livy/data/

# # Nama pengguna dan grup yang akan dicek dan dibuat
# USERNAME="airflow"
# GROUPNAME="root"

# # Memeriksa apakah pengguna sudah ada
# if id "$USERNAME" >/dev/null 2>&1; then
#   echo "Pengguna '$USERNAME' sudah ada. Melewati pembuatan pengguna."
# else
#   # Membuat pengguna dengan shell bash dan home directory
#   sudo useradd -ms /bin/bash "$USERNAME"
#   echo "Pengguna '$USERNAME' telah dibuat."
# fi

# # Memeriksa apakah grup sudah ada
# if getent group "$GROUPNAME" >/dev/null 2>&1; then
#   echo "Grup '$GROUPNAME' sudah ada."
# else
#   echo "Grup '$GROUPNAME' tidak ditemukan. Tidak membuat grup baru."
# fi

# # Menambahkan pengguna ke grup jika belum ditambahkan
# if id -nG "$USERNAME" | grep -qw "$GROUPNAME"; then
#   echo "Pengguna '$USERNAME' sudah dalam grup '$GROUPNAME'."
# else
#   # Menambahkan pengguna ke grup
#   sudo usermod -aG "$GROUPNAME" "$USERNAME"
#   echo "Pengguna '$USERNAME' telah ditambahkan ke grup '$GROUPNAME'."
# fi

sudo chown airflow:root -R /home/bdata/bigdata-file/airflow
sudo chown airflow:root -R /home/bdata/bigdata-file/postgres
sudo chmod 777 -R /home/bdata/bigdata-file/airflow
sudo chmod 777 -R /home/bdata/bigdata-file/postgres