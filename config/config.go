package config

import (
	"database/sql"
	"os"

	"github.com/go-redis/redis"
)

var (
	// DBCon is the connection handle
	// for the database
	Db *sql.DB
)

func ConnectDB() {
	db, err := sql.Open("mysql", "root:happy123@tcp(127.0.0.1:3306)/malabar_db?parseTime=true")
	if err != nil {
		panic(err.Error())
	}

	Db = db
}

var Rdb *redis.Client

func ConnectRedis() {
	//Initializing redis
	dsn := os.Getenv("REDIS_DSN")
	if len(dsn) == 0 {
		dsn = "localhost:6379"
	}
	Rdb = redis.NewClient(&redis.Options{
		Addr: dsn, //redis port
	})
	_, err := Rdb.Ping().Result()
	if err != nil {
		panic(err)
	}
}
