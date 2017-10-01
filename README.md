# Great-circle distance

Calculate the great-circle distance on the Earth having a pair of Latitude/Longitude points

The *great-circle distance* is the shortest distance between two points on the surface of a sphere, measured along the surface of the sphere (as opposed to a straight line through the sphere's interior)

Included in this library:

- Spherical law of cosines 
- Haversine formula 
- Vincenty` formula (por from the Android implementation)

`Disclaimer`: The earth is not quite a sphere. This means that errors([0.3%][1],[0.5%][2] errors) from assuming spherical geometry might be considerable depending on the points; so: `don't trust your life on this value`

Check Wikipedia for detailed description on [Great-circle distance][3]

[1]: https://gis.stackexchange.com/questions/25494/how-accurate-is-approximating-the-earth-as-a-sphere#25580
[2]: https://en.wikipedia.org/wiki/Great-circle_distance#cite_note-1
[3]: https://en.wikipedia.org/wiki/Great-circle_distance