install: redis-cli.rb
	brew install --build-from-source $^
.PHONY: install
