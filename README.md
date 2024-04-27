# Basic Python skeleton project with conda

Set Python version in `Makefile`

## Local development with `venv`
* run `make venv` to create `venv`
* run `make venv-redo` to recreate `venv`
* run `conda activate ./venv` to activate `venv`
* run `make pip` to install dependencies
* run `make lint` to lint code
* run `make test` to run tests
* test coverage in `./var/coverage_html_report` folder

## Development in Docker
* run `make up`
* open in browser http://127.0.0.1:81 for Jupyter Notebook
* run `make d-pip` to install dependencies in container
* run `make d-lint` to lint code in container
* run `make d-test` to run tests in container

