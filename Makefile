run-build:
	docker compose down && docker compose rm -f -s && docker compose up --build
run:
	docker compose up --build