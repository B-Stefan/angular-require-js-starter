watch = mimosa watch
build = mimosa build

.PHONY : start startd build build-opt buildo clean pack package

start:
	@echo "[x] Building assets and starting development server..."
	@$(watch) -s

startd:
	@echo "[x] Cleaning compiled directory, building assets and starting development server.."
	@$(watch) -sd

build:
	@echo "[x] Building assets..."
	@$(build)

build-opt:
	@echo "[x] Building and optimizing assets..."
	@$(build) -o

buildo:
	@echo "[x] Building and optimizing assets..."
	@$(build) -o

clean:
	@echo "[x] Removing compiled files..."
	@mimosa clean

pack:
	@echo "[x] Building and packaging application..."
	@$(build) -pm

	cd dist perl -pi -w -e 's/server.coffee/server.js/g;' *.*; \
	cd dist coffee -c server.coffee; \
	cd dist coffee -c routes; \


package:
	@echo "[x] Building and packaging application..."
	@$(build) -omp