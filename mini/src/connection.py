import os
import pymysql
import psycopg2

def connect_mysql():
    # Open database connection
    # Connect to the database"
    host = os.environ.get("MYSQL_HOST")
    port = (int)(os.environ.get("MYSQL_PORT"))
    user = os.environ.get("MYSQL_USER")
    password = os.environ.get("MYSQL_PASSWORD")
    # print(host, port, user, password)

    db = pymysql.connect(
        host=host,
        port=port,
        user=user,
        password=password,
        database="BIRD",
        # unix_socket="/tmp/mysql.sock",
    )
    return db


def connect_postgresql():
    # Open database connection
    # Connect to the database
    host = os.environ.get("PG_HOST")
    port = os.environ.get("PG_PORT")
    user = os.environ.get("PG_USER")
    password = os.environ.get("PG_PASSWORD")

    db = psycopg2.connect(
        f"dbname=BIRD user={user} host={host} password={password} port={port}"
    )
    return db
