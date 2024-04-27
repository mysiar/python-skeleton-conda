SHELL := /bin/bash
PYTHON_VER := 3.12

# Local development with conda

venv::
	conda create -p ./venv python=$(PYTHON_VER) -y

venv-redo::
	rm -rf ./venv
	$(MAKE) venv

pip::
	pip install -r requirements.txt
	pip install -r requirements.dev.txt

lint::
	pylint src/ tests/ || true

test::
	mkdir -p ./var
	python -m coverage run -m unittest discover tests
	python -m coverage html


# Docker development
up::
	$(MAKE) down || true
	docker-compose rm -f || true
	docker-compose up --build -d

down::
	docker-compose down

d-pip::
	docker-compose exec anaconda pip install --root-user-action=ignore -r requirements.txt
	docker-compose exec anaconda pip install --root-user-action=ignore -r requirements.dev.txt

d-lint::
	docker-compose exec anaconda pylint src/ tests/

d-test::
	docker-compose exec anaconda mkdir -p ./var
	docker-compose exec anaconda python -m coverage run -m unittest discover tests
	docker-compose exec anaconda python -m coverage html

enter::
	docker-compose exec anaconda /bin/bash



