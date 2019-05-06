var container = document.getElementById('popup');
var content = document.getElementById('popup-content');
var closer = document.getElementById('popup-closer');

var overlay = new ol.Overlay({
       element: container,
       autoPan: true,
       autoPanAnimation: {
         duration: 250
       }
     });

     closer.onclick = function() {
       overlay.setPosition(undefined);
       closer.blur();
       return false;
     };

var map = new ol.Map({
  layers: [
    new ol.layer.Tile({
      source: new ol.source.OSM()
    })
  ],
  overlays: [overlay],
  target: 'map',
  view: new ol.View({
    center: ol.proj.fromLonLat([-98.556732, 39.809879]),
    zoom: 5
  })
});

map.on('singleclick', function(evt) {
          var coordinate = evt.coordinate;
          var hdms = ol.coordinate.toStringHDMS(ol.proj.fromLonLat(coordinate));

          content.innerHTML = '<p>You clicked here:</p><code>' + hdms +'</code>';
          overlay.setPosition(coordinate);
        });
