function createMap(_gunViolence) {
 // Create the tile layer that will be the background of our map.
    let streetmap = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
});
//linking to the geojson url to a value to be accessed
    url1 = 
    url2 = "http://127.0.0.1:5000/api/v1.0/state population"
    url3 = "http://127.0.0.1:5000/api/v1.0/county population"

// Create a baseMaps object to hold the streetmap layer.
    let baseMaps = {
    "Street Map": streetmap
  };

// Create an overlayMaps object to hold the bikeStations layer.
    let overlayMaps = {
    "state_id": state
      };


  // Create the map object with options.
  let map = L.map("map-id", {
    center: [40.73, -74.0059],
    zoom: 12,
    layers: [streetmap, state]
  });
  // Create a layer control, and pass it baseMaps and overlayMaps. Add the layer control to the map.
  L.control.layers(baseMaps, overlayMaps, {
    collapsed: false
  }).addTo(map);
}
//Create markers
function createMarkers(response) {
    
    //allowing the data to be viewed in the console
    console.log(response)
    // Pull the "stations" property from response.data.
    let casuals = response.casualties;
  
    // Initialize an array to hold the bike markers.
    let violenceMarkers = [];
  
    // Loop through the stations array.
    for (let index = 0; index < casuals.length; index++) {
      let casual = casuals[index];
  
      // For each station, create a marker, and bind a popup with the station's name.
      let violenceMarker = L.marker([casual.lat, casual.long])
        .bindPopup("<h3>" + casual.city + "<h3><h3>Ethnicity: " + casual.race_ethnicity_shooter1 + "</h3>");
  
      // Add the marker to the bikeMarkers array.
      violenceMarkers.push(violenceMarker);
    }
  
    // Create a layer group that's made from the bike markers array, and pass it to the createMap function.
    createMap(L.layerGroup(violenceMarkers));
  }

  
/* 
    var chart = new CanvasJS.Chart("chartContainer", {
        title: {
            text: "School Shooting Increase"
        },
        axisX: {
            valueFormatString: "MMM YYYY"
        },
        axisY2: {
            title: "Average Rental Income",
            prefix: "$",
            suffix: "K"
        },
        toolTip: {
            shared: true
        },
        legend: {
            cursor: "pointer",
            verticalAlign: "top",
            horizontalAlign: "center",
            dockInsidePlotArea: true,
            itemclick: toogleDataSeries
        },
        data: [{
            type:"line",
            axisYType: "secondary",
            name: "New York",
            showInLegend: true,
            markerSize: 0,
            yValueFormatString: "$#,###k",
            dataPoints: dataPoints	
            
        }]
    });
    
    chart.render();
    
     */
// Perform an API call to the Citi Bike API to get the station information. Call createMarkers when it completes.
axios.get('http://127.0.0.1:5000/api/v1.0/shooting')
    .then(response => {
        console.log(response.data)
    })
/* d3.json(url2).then(createMarkers);
d3.json(url3).then(createMarkers);
 */