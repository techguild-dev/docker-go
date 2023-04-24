package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.Run(":8080")
	//fmt.Println("Hello, World!")
}
