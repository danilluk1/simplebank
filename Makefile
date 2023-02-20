migrateup:
	migrate -path db/migration -database "postgresql://test:test@localhost:5432/simplebank?sslmode=disable" -verbose up
	
migratedown:
	migrate -path db/migration -database "postgresql://test:test@localhost:5432/simplebank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/danilluk1/simplebank/db/sqlc Store

.PHONY: migrateup migratedown sqlc test server mock