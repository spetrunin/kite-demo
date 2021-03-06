PROJECT_PATH = src/demo
GOPATH := $(shell pwd):$(shell pwd)/$(PROJECT_PATH)
ENV = GOPATH=${GOPATH}

router:
	cd $(PROJECT_PATH) && ${ENV} go run routerkite.go

app:
	cd $(PROJECT_PATH) && ${ENV} go run appkite.go

db:
	cd $(PROJECT_PATH) && ${ENV} go run dbkite.go

auth:
	cd $(PROJECT_PATH) && ${ENV} go run authkite.go

run: db auth app router

get:
	${ENV} go get github.com/koding/kite/kontrol/kontrol
	${ENV} go get github.com/koding/kite/
	# ${ENV} go get github.com/smartystreets/goconvey
	${ENV} go get gopkg.in/yaml.v2
	${ENV} go get -u golang.org/x/tools/cmd/goimports

test:
	cd $(PROJECT_PATH)/auth && ${ENV} go test -v

# webtest:
# 	cd $(PROJECT_PATH) && ${ENV} goconvey
