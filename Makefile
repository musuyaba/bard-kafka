run-build:
	docker compose down --volumes && docker compose up --build
run:
	docker compose up --build