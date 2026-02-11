

gen:
	@echo "Generate go grpc files"
	@protoc -I ./proto ./proto/sso/sso.proto --go_out=./gen/go --go_opt=paths=source_relative --go-grpc_out=./gen/go --go-grpc_opt=paths=source_relative

some:
	git add .
	git ci -m "init"
	git remote add origin git@github.com:Nedofff/ssoprotos.git
	git push -u origin main

.PHONY: gen