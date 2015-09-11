build:
	docker build -t yurrriq/rethinkdb .
run:
	docker run -d -P --name rethink1 yurrriq/rethinkdb
