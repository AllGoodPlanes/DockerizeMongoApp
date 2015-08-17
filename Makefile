# Deletes existing mongoapp
deleteApp:	mongoapp
	docker rmi -f mongoapp




# To STATICALLY compile the Golang code and build the Docker Image.
builddocker:	eAddress.go
	CGO_ENABLED=0 GOOS=linux go build -ldflags "-s" -a -installsuffix cgo -o eAddress .
	docker build -t mongoapp .

# Runs the app and publishes it so it can be seen on port 8080 of the local PC.
dockerrun:
	docker run --publish=8080:8080 --name=goweb --rm mongoapp