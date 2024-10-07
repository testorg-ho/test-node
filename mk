# Define variables
VENV_DIR := venv
PYTHON := $(VENV_DIR)/bin/python
PIP := $(VENV_DIR)/bin/pip
TEST_DIR := tests
REQ_FILE := requirements.txt

# Default goal
.PHONY: all
all: test

# Create virtual environment
$(VENV_DIR):
	python3 -m venv $(VENV_DIR)

# Install dependencies
.PHONY: install
install: $(VENV_DIR)
	$(PIP) install -r $(REQ_FILE)

# Run tests
.PHONY: test
test: install
	$(PYTHON) -m unittest discover -s $(TEST_DIR)

# Clean up the virtual environment and other artifacts
.PHONY: clean
clean:
	rm -rf $(VENV_DIR)
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -exec rm -rf {} +

# Reinstall dependencies and rerun tests
.PHONY: reinit
reinit: clean all
