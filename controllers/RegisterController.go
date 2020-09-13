package controllers

import (
	"net/http"
	"ripplsserver/config"
	"ripplsserver/models"
	"ripplsserver/services"
	"time"

	"github.com/gin-gonic/gin"
)

func RegisterController(c *gin.Context) {
	var user models.User
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	// run validations

	user.Dob = time.Now()
	user.User_password = services.HashAndSalt([]byte(user.User_password))
	user.Update_time = time.Now()
	user.Create_time = time.Now()

	pdo, err := config.Db.Prepare("INSERT INTO users (email, user_name, user_password, dob, update_time, create_time) values (?,?,?,?,?,?)")
	defer pdo.Close()
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	_, err = pdo.Exec(user.Email, user.User_name, user.User_password, user.Dob, user.Update_time, user.Create_time)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	} else {
		c.JSON(http.StatusOK, gin.H{"message": "success"})
		return
	}
}
