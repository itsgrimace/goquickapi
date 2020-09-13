package main

import (
	"fmt"
	"os"
	"ripplsserver/config"
	"ripplsserver/controllers"
	"ripplsserver/middleware"
	"time"

	_ "github.com/go-sql-driver/mysql"

	"github.com/gin-gonic/gin"
)

func main() {
	// Setup Gin framework to handle the routing
	router := gin.New()
	// open the database connection
	config.ConnectDB()
	config.ConnectRedis()
	os.Setenv("ACCESS_SECRET", "jdnfksdmfksd") //this should be in an env file

	router.Use(gin.LoggerWithFormatter(func(param gin.LogFormatterParams) string {

		// your custom format
		return fmt.Sprintf("%s - [%s] \"%s %s %s %d %s \"%s\" %s\"\n",
			param.ClientIP,
			param.TimeStamp.Format(time.RFC1123),
			param.Method,
			param.Path,
			param.Request.Proto,
			param.StatusCode,
			param.Latency,
			param.Request.UserAgent(),
			param.ErrorMessage,
		)
	}))
	router.Use(gin.Recovery())
	// useful for testing connectivity
	router.GET("/ping", func(c *gin.Context) {
		c.String(200, "pong")
	})
	router.POST("/register", controllers.RegisterController)
	router.POST("/login", controllers.LoginController)

	// Authorization group
	authorized := router.Group("/")

	authorized.Use(middleware.AuthUser())
	{
		authorized.GET("/welcome", controllers.TestAuthenticated)
		// login item to update last login
		//authorized.POST("/login", controllers.LoginConfirmed)
		// events routes
		// 	//authorized.POST("/events", controllers.GetEvents)
		// 	//authorized.PUT("/events", controllers.NewEvent)
		// 	//authorized.DELETE("/events", controllers.DeleteEvent)
		//location routes
		// 	//authorized.POST("/locations", controllers.GetLocations)
	}

	router.Run(":8080")
	defer config.Db.Close()
}
