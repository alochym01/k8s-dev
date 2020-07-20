package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func hello(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "hello world",
	})
}
func main() {
	fmt.Println("hello world")
	router := gin.Default()
	router.GET("/", hello)
	router.Run()
}
