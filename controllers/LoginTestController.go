package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func TestAuthenticated(c *gin.Context) {
	c.JSON(http.StatusOK, "Auth Token Accepted")
}
