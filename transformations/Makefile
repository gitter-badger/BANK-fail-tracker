SHELL = /bin/bash
GENERATED_FILES = failed-banks.geojson

.PHONY: all clean

all: $(GENERATED_FILES)

clean:
	rm -Rf data/*

.INTERMEDIATE: failed-bank-tracker.csv
failed-bank-tracker.csv:
	cat ../csv\ files/failed-bank-tracker.csv > $@

.INTERMEDIATE: lat_lng_without_header.csv
lat_lng_without_header.csv: failed-bank-tracker.csv
	csvcut -c 5 $< | tail -n +2 > $@

.INTERMEDIATE: latitudelongitude.csv
latitudelongitude.csv: lat_lng_without_header.csv
	cat <( echo "latitude, longitude"; cat $< ) > $@

.INTERMEDIATE: longitude.csv
longitude.csv: latitudelongitude.csv
	cat $< | awk -F',' '{print $$2}' | sed 's/["\)\(]//g' | awk '{$$1=$$1};1' > $@

.INTERMEDIATE: latitude.csv
latitude.csv: latitudelongitude.csv
	cat $< | awk -F',' '{print $$1}' | sed 's/["\)\(]//g' | awk '{$$1=$$1};1' > $@

.INTERMEDIATE: banks.csv
banks.csv: failed-bank-tracker.csv longitude.csv latitude.csv
	csvjoin $^ > $@

failed-banks.geojson: banks.csv
	csvjson --lat latitude --lon longitude --crs EPSG:4269 $< > data/$(notdir $@)

