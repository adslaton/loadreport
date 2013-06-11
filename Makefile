# set environment variables
SHELL := /bin/bash


## set target specific variables ##
site = alpha.cnn.com

# load js file
load = loadreport.js

# speed js file
speed = speedreport.js

# json || csv
format = json

# performance || performance cache
type = performance


# define targets
.PHONY: test test-speed test-load clean


test:
	phantomjs $(speed) http://$(site)


test-speed: test


test-load:
	phantomjs $(load) http://$(site) $(type) $(format)


clean:
	rm -f speedreports/$(site).html
	rm -f speedreports/$(site).js
	rm -f reports/$(load)on
