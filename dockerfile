FROM golang:alpine3.16 as builder

WORKDIR /go

RUN echo 'package main; import "fmt"; func main() {fmt.Println("Full Cycle Rocks!!")}' > fullcycle.go

RUN go build fullcycle.go

FROM hello-world

WORKDIR /fullcycle

COPY --from=builder /go/fullcycle .

CMD ["./fullcycle"]

