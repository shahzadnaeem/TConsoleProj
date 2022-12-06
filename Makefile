SRC=src
TESTS=tests

PROJECT=$(SRC)/TConsoleProj
LIB_PROJECT=$(SRC)/TConsoleProjLib
TEST_PROJECT=$(TESTS)/TConsoleProj.Test
TEST_RESULTS=$(TEST_PROJECT)/TestResults
TEST_REPORT=$(TEST_PROJECT)/TestReport

DOTNET=dotnet
COVERAGE_REPORTER=$(TEST_PROJECT)/scripts/createCoverageReport.sh

.PHONY: build clean watch run test coverage coverage-report coverage-report-html

build:
	$(DOTNET) $@

clean:
	$(DOTNET) $@
	rm -rf $(TEST_RESULTS) $(TEST_REPORT)

watch run:
	$(DOTNET) $@ --project $(PROJECT)

test:
	$(DOTNET) test $(TEST_PROJECT)

coverage:
	rm -rf $(TEST_RESULTS)
	$(DOTNET) test $(TEST_PROJECT) --collect "Xplat Code Coverage"

coverage-report: coverage
	$(COVERAGE_REPORTER) $(TEST_PROJECT)

coverage-report-html: coverage
	$(COVERAGE_REPORTER) $(TEST_PROJECT) HTML
