
check_defined = \
    $(strip $(foreach 1,$1, \
        $(if $(value $1),, $(error Ошибка: Переменная '$1' не определена))))

gen:
	@echo "Generate go grpc files"
	@protoc -I ./proto ./proto/sso/*.proto --go_out=./ --go_opt=paths=source_relative --go-grpc_out=./ --go-grpc_opt=paths=source_relative

pushwt:
	$(call check_defined, MESSAGE)
	git add .
	git ci -m "$(MESSAGE)"
	git push origin

push:
	$(call check_defined, MESSAGE TAG)
	git add .
	git tag ${TAG}
	git ci -m "$(MESSAGE)"
	git push origin

all: gen push

.PHONY: gen push all