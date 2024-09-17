import os
import pymysql
import psycopg2

def connect_mysql():
    # Open database connection
    # Connect to the database"
    db = pymysql.connect(
        host="localhost",
        user="root",
        password="YOUR_PASSWORD",
        database="BIRD",
        unix_socket="/tmp/mysql.sock",
        # port=3306,
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
