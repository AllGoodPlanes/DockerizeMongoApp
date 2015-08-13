# 'tianon/true' is a mimimal golang image - size: 125B.
FROM tianon/true

# http server listens on port 8080.
EXPOSE 8080

# Access to root SSL certificates is needed - ca-certificates first copied to 'Dockerfile' from /etc/ssl/certs/
COPY ca-certificates.crt  /etc/ssl/certs/

# The statically compiled eAddress.go file. In the terminal type: 'CGO_ENABLED=0 GOOS=linux go build -ldflags "-s" -a -installsuffix cgo -o eAddress .' to statically compile.
ADD eAddress /

CMD ["/eAddress"]

# Type: '$ docker run --publish=8080:8080 --name=goweb --rm mongoapp' in terminal to run the app.