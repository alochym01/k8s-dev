FROM golang:1.13 as golang
ENV GO111MODULE=on
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 go build -ldflags '-extldflags "-static"'
RUN ls /go/src/app

FROM scratch
COPY --from=golang /go/src/app/k8s-dev /app
ENTRYPOINT ["/app"]
