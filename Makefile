.DEFAULT_GOAL := check
isort = isort src tests
black = black src tests
mypy = mypy --install-types --non-interactive src

.PHONY: install-package format lint mypy check build push-test push docs clean


install-package:
	@echo "Install package"
	pip install -e .

format:
	@echo "Run code formatters"
	$(isort)
	$(black)


lint:
	@echo "Run linters"
	$(isort) --check-only
	$(black) --check


test:
	@echo "Run tests"
	pytest -vvs --cov=compoviz tests


testcov: test
	@echo "Build coverage html"
	@coverage html


mypy:
	@echo "Run mypy static analysis"
	$(mypy)


check: lint test mypy

build:
	@echo "Build Python package"
	python -m build --sdist --wheel
	python -m twine check dist/*


push-test:
	@echo "Push package to test.pypi.org"
	python -m twine upload --verbose --repository testpypi dist/*


push:
	@echo "Run package to PyPI"
	python -m twine upload --verbose dist/*


clean:
	@echo "Clean up files"
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf .cache
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf htmlcov
	rm -rf *.egg-info
	rm -f .coverage
	rm -f .coverage.*
	rm -rf build
	rm -rf dist

docs:
	pip install -U -r docs/requirements.txt
	make -C docs html