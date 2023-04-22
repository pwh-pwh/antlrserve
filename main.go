package main

import (
	"github.com/pwh-pwh/antlrserve/service"
	"io"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"os/exec"
)

//grun Hello prog -ps out.ps input.txt

//go:generate chmod +x ./parser/gen.sh
//go:generate chmod +x ./parser/run.sh
//go:generate chmod +x ./parser/wf.sh
//go:generate ./parser/gen.sh
func main() {
	http.HandleFunc("/minic", func(writer http.ResponseWriter, request *http.Request) {
		bytes, err := ioutil.ReadAll(request.Body)
		if err != nil {
			log.Println("read body err:", err)
			return
		}
		log.Printf("recv:%s\n", bytes)
		service.DoParser(string(bytes))
		DoImgCvAndWf()
		imgFile, err := os.Open("img/out.png")
		if err != nil {
			log.Println(err)
			writer.WriteHeader(http.StatusInternalServerError)
			return
		}
		writer.Header().Set("Content-Type", "image/jpeg")
		io.Copy(writer, imgFile)
	})
	err := http.ListenAndServe(":8888", nil)
	if err != nil {
		log.Println("serve error:", err)
	}
}

func DoImgCvAndWf() {
	err := exec.Command(`./parser/wf.sh`).Run()
	if err != nil {
		log.Println(err)
	}
}

//convert -colorspace Gray -density 300 out.eps -background white -flatten -resize 1863x2636 -units pixelsperinch -density 224.993 out.png
//convert -colorspace Gray -density 300 out.ps -background white -flatten -units pixelsperinch out.png
