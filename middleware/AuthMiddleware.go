package middleware

import (
	"fmt"
	"net/http"
	"os"

	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
)

type AccessDetails struct {
	AccessUuid string
	UserId     uint64
}

func AuthUser() gin.HandlerFunc {
	return func(c *gin.Context) {
		//get the token
		bearToken := c.Request.Header.Get("Authorization")
		// verify the token
		token, err := jwt.Parse(bearToken, func(token *jwt.Token) (interface{}, error) {
			//Make sure that the token method conform to "SigningMethodHMAC"
			if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
				return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
			}
			return []byte(os.Getenv("ACCESS_SECRET")), nil
		})
		if err != nil {
			fmt.Println("i see a problem here")
			c.JSON(http.StatusUnauthorized, err.Error())
			return
		}
		fmt.Println("seems valid")
		// vaildate the token
		if _, ok := token.Claims.(jwt.Claims); !ok && !token.Valid {
			c.JSON(http.StatusUnauthorized, err.Error())
			return
		}
		c.Next()
		return
	}
}
