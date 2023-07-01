all: client server

client:
	@echo "--> Generating Python client files"
	python -m grpc_tools.protoc -I protobuf/ --python_out=. --grpc_python_out=. protobuf/primefactor.proto
	@echo ""

server:
	@echo "--> Generating Go files"
	protoc --proto_path=protobuf protobuf/primefactor.proto --go_out=. --go-grpc_out=.
	@echo ""

install:
	@echo "--> Installing Python grpcio tools"
	pip install -U grpcio grpcio-tools
	@echo ""

	@echo "--> Installing Golang tools"
	go get google.golang.org/grpc
	go install google.golang.org/protobuf/cmd/protoc-gen-go
	@echo ""
