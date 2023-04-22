package service

import (
	"fmt"
	"log"
	"os"
	"os/exec"
)

func DoParser(str string) {
	file, err := os.Create("example/input.txt")
	if err != nil {
		log.Println("create input.txt error:", err)
		return
	}
	defer file.Close()
	_, err = file.WriteString(str)
	if err != nil {
		log.Println("write str err:", err)
		return
	}
	cmd := exec.Command("parser/run.sh")
	output, err := cmd.Output()
	fmt.Println(string(output))
	if err != nil {
		fmt.Println("err :")
		fmt.Println(err)
		return
	}
	fmt.Println("result:", string(output))

}
