

gen:
	@echo "Generate go grpc files"
	@protoc -I ./proto ./proto/sso/sso.proto --go_out=./gen/go --go_opt=paths=source_relative --go-grpc_out=./gen/go --go-grpc_opt=paths=source_relative

push:
	git add .
	git ci -m "$(MESSAGE)"
	git push -u origin main

.PHONY: gen