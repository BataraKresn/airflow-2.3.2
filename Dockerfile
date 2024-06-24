# Base Airflow image
FROM apache/airflow:2.3.2

# Switch to root user to install system packages if needed
USER root

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    build-essential \
    libsasl2-dev \
    libldap2-dev \
    libssl-dev \
    krb5-user \
    libkrb5-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy custom plugin
COPY redis_xcom_backend.py /opt/airflow/plugins/

# Switch back to the Airflow user
USER airflow

# Install Python packages and Airflow providers
RUN python -m pip install --upgrade pip
RUN pip install --upgrade marshmallow
RUN pip install "pandas" "requests" "pymongo" "clickhouse_driver" "redis"
RUN pip install "apache-airflow-providers-apache-spark" "apache-airflow-providers-apache-hive" "apache-airflow-providers-apache-hdfs"

# Clean up pip cache
RUN pip cache purge
