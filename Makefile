migrateup:
	migrate -path db/migration -database "postgresql://test:test@localhost:5432/simplebank?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://test:test@localhost:5432/simplebank?sslmode=disable" -verbose up 1
	
migratedown:
	migrate -path db/migration -database "postgresql://test:test@localhost:5432/simplebank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://test:test@localhost:5432/simplebank?sslmode=disable" -verbose down 1
sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/danilluk1/simplebank/db/sqlc Store

proto:
	rm -f pb/*.go
	protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative \
    --go-grpc_out=pb --go-grpc_opt=paths=source_relative \
		--grpc-gateway_out=pb --grpc-gateway_opt=paths=source_relative \
    proto/*.proto

.PHONY: migrateup migratedown sqlc test server mock migratedown1 proto