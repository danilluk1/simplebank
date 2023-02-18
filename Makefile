migrateup:
	migrate -path db/migration -database "postgresql://test:test@localhost:5432/simplebank?sslmode=disable" -verbose up
	
migratedown:
	migrate -path db/migration -database "postgresql://test:test@localhost:5432/simplebank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: migrateup migratedown sqlc