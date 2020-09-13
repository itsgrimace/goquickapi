package controllers

import (
	"net/http"
	"ripplsserver/config"
	"ripplsserver/models"
	"ripplsserver/services"

	"github.com/gin-gonic/gin"
)

func LoginController(c *gin.Context) {
	var user models.User
	var auth models.User
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "bad request"})
		return
	}
	// prepare the PDO
	pdo, err := config.Db.Prepare("SELECT * FROM users where user_name = ? || email = ?")
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	defer pdo.Close()
	err = pdo.QueryRow(user.User_name, user.Email).Scan(&auth.Id, &auth.Email, &auth.Phone, &auth.User_name, &auth.User_password, &auth.Bio, &auth.Postcode, &auth.Push_notifications, &auth.User_active, &auth.User_suggestions, &auth.Dob, &auth.Update_time, &auth.Create_time, &auth.Last_login)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "user not found"})
		return
	}
	// check the password
	if !services.ComparePasswords(auth.User_password, []byte(user.User_password)) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "bad password"})
		return
	}

	// generate the token and return to the user
	token, err := services.CreateToken(user.Id)
	if err != nil {
		c.JSON(http.StatusUnprocessableEntity, err.Error())
		return
	}
	services.CreateAuth(auth.Id, token)
	c.JSON(http.StatusOK, token)
	return
}
