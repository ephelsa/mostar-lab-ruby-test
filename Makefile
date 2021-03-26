DEV_ENV=$(shell cat .env)

install-dependencies:
	@bundle install

dev-db-mount:
	@echo "-- Creating container for database"
	$(DEV_ENV) | docker-compose up --remove-orphans -d

tests-prepare: install-dependencies dev-db-mount
	@echo "-- Preparing database"
	$(DEV_ENV) RAILS_ENV=test bin/rails db:drop db:create db:schema:load

tests: tests-prepare
	@echo "-- Running tests"
	$(DEV_ENV) RAILS_ENV=test bin/rails -t

dev-prepare: install-dependencies dev-db-mount
	@echo "-- Preparing database"
	$(DEV_ENV) RAILS_ENV=development bin/rails db:drop db:create db:migrate db:seed

run-dev: dev-prepare
	@echo "-- Starting app"
	$(DEV_ENV) bin/rails server -b 0.0.0.0 -p 3000 -e development

.PHONY: run-dev dev-prepare dev-db-mount tests tests-prepare install-dependencies