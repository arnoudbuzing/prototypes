plane = Import[ FileNameJoin[ { ParentDirectory[$InputDirectoryName,2], "icons", "plane.png"} ] ];


OpenSky[location_, range_, opts___] := Module[{latlongs, response, result, geopos},
  latlongs = Flatten[QuantityMagnitude /@ LatitudeLongitude /@ GeoBoundingBox[GeoDisk[location, range]]];
  response = URLRead[TemplateApply[ StringTemplate[ "https://opensky-network.org/api/states/all?lamin=`1`&lomin=`2`&lamax=`3`&lomax=`4`"], latlongs]];
  result = ImportString[response["Body"], "RawJSON"];
  geopos = ProcessFlightInformation /@ result["states"];
  GeoGraphics[geopos, opts, GeoCenter -> location, GeoRange -> range]
]



ProcessFlightInformation[state_] := Module[{
  oca024, callsign, originCountry, timePosition, lastContact,
  longitude, latitude, geoAltitude, onGround, velocity, trueTrack,
  verticalRate, sensors, baroAltitude, squawk, spi, positionSource
  },
  {
    oca024, callsign, originCountry, timePosition, lastContact,
    longitude, latitude, geoAltitude, onGround, velocity, trueTrack,
    verticalRate, sensors, baroAltitude, squawk, spi,
    positionSource} = state;
  GeoMarker[GeoPosition[{latitude, longitude}], Rotate[plane, Quantity[-trueTrack, "Degrees"]]]
]
