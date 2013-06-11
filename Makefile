# set environment variables
SHELL := /bin/bash


## set target specific variables ##

# site param that is passed in
SITE = ${site}

# load js file
LOAD = loadreport.js

# speed js file
SPEED = speedreport.js

# json || csv
FORMAT = json

# performance || performance cache
TYPE = performance


# define targets
.PHONY: test test-speed test-load clean


test:
	phantomjs $(SPEED) http://$(SITE)


test-speed: test


test-load:
	phantomjs $(LOAD) http://$(SITE) $(TYPE) $(FORMAT)


clean:
	rm -f speedreports/$(SITE).html
	rm -f speedreports/$(SITE).js
	rm -f reports/$(LOAD)on
