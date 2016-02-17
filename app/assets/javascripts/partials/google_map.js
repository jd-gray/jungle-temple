// Google Map
var map;
var marker;
var MY_MAPTYPE_ID = 'custom_style';

function initMap() {

  // Boundary variable
  var bounds = new google.maps.LatLngBounds();

  // Map Style
  var features = [
    {
        "elementType": "geometry",
        "stylers": [
            {
                "hue": "#ff4400"
            },
            {
                "saturation": -68
            },
            {
                "lightness": -4
            },
            {
                "gamma": 0.72
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.icon"
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "geometry",
        "stylers": [
            {
                "hue": "#0077ff"
            },
            {
                "gamma": 3.1
            }
        ]
    },
    {
        "featureType": "water",
        "stylers": [
            {
                "hue": "#00ccff"
            },
            {
                "gamma": 0.44
            },
            {
                "saturation": -33
            }
        ]
    },
    {
        "featureType": "poi.park",
        "stylers": [
            {
                "hue": "#44ff00"
            },
            {
                "saturation": -23
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "hue": "#007fff"
            },
            {
                "gamma": 0.77
            },
            {
                "saturation": 65
            },
            {
                "lightness": 99
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "gamma": 0.11
            },
            {
                "weight": 5.6
            },
            {
                "saturation": 99
            },
            {
                "hue": "#0091ff"
            },
            {
                "lightness": -86
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": -48
            },
            {
                "hue": "#ff5e00"
            },
            {
                "gamma": 1.2
            },
            {
                "saturation": -23
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "saturation": -64
            },
            {
                "hue": "#ff9100"
            },
            {
                "lightness": 16
            },
            {
                "gamma": 0.47
            },
            {
                "weight": 2.7
            }
        ]
    }
  ]

  // Start Location
  var phoenix = new google.maps.LatLng(33.446478, -112.074050);

  // Map Options
  var mapOptions = {
    zoom: 10,
    center: phoenix,
    scrollwheel: false,
    mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
      },
    mapTypeId: MY_MAPTYPE_ID
  };

  // Google Map
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);

  // Custom Style Map
  var styledMapOptions = {
      name: 'Custom Style'
  };
  var customMapType = new google.maps.StyledMapType(features, styledMapOptions);
  map.mapTypes.set(MY_MAPTYPE_ID, customMapType);

  // Ruby Array to JS Array
  var locationArray = gon.locations;

  // Loop through array to pull out needed values
  for (var i = 0; i < locationArray.length; i++) {
    // Marker variables
    var lat = locationArray[i].lat;
    var lon = locationArray[i].long;
    var positionMarker = new google.maps.LatLng(lat, lon);
    bounds.extend(positionMarker);

    // Marker setup
    marker = new google.maps.Marker({
        map: map,
        position: positionMarker,
        animation: google.maps.Animation.DROP
    });

    // Map fits around markers
    map.fitBounds(bounds);
  }

  var drawingManager = new google.maps.drawing.DrawingManager({
    drawingMode: google.maps.drawing.OverlayType.MARKER,
    drawingControl: true,
    drawingControlOptions: {
      position: google.maps.ControlPosition.TOP_CENTER,
      drawingModes: [
        google.maps.drawing.OverlayType.CIRCLE,
        google.maps.drawing.OverlayType.POLYGON,
        google.maps.drawing.OverlayType.POLYLINE,
        google.maps.drawing.OverlayType.RECTANGLE
      ]
    },
    circleOptions: {
      fillColor: '#ffff00',
      fillOpacity: 1,
      strokeWeight: 5,
      clickable: false,
      editable: true,
      zIndex: 1
    }
  });
  drawingManager.setMap(map);
}