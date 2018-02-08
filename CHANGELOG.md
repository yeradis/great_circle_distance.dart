# Changelog

## 0.0.1

- Initial version for the great-circle distance (Spherical law of cosines, Haversine formula and Vincenty` formula)

## 0.0.2

- Minor update to sample code

## 0.0.3

- Add an usage example the the README

## 0.0.5

- Update descriptions

## 0.0.6

- Minor test update, added travis integration

## 1.0.0
Added coordinates validation. 
A coordinate is considered invalid if it meets at least one of the following criteria:
- Its latitude is greater than 90 degrees or less than -90 degrees.
- Its longitude is greater than 180 degrees or less than -180 degrees.

see [Decimal degrees](https://en.wikipedia.org/wiki/Decimal_degrees)

## 1.0.1
Remove upper bound Dart SDK constraint

thanks to @bramvbilsen for pointing it out and for the PR