function createMap(gunViolence) {
 // Create the tile layer that will be the background of our map.
    let streetmap = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
});
// Create a baseMaps object to hold the streetmap layer.
    let baseMaps = {
    "Street Map": streetmap
  };

// Create an overlayMaps object to hold the bikeStations layer.
    let overlayMaps = {
    "Bike Stations": bikeStations
      };
  // Create the map object with options.
  let map = L.map("map-id", {
    center: [40.73, -74.0059],
    zoom: 12,
    layers: [streetmap, bikeStations]
  });
  // Create a layer control, and pass it baseMaps and overlayMaps. Add the layer control to the map.
  L.control.layers(baseMaps, overlayMaps, {
    collapsed: false
  }).addTo(map);
}

function createMarkers(response) {

    // Pull the "stations" property from response.data.
    let stations = response.data.stations;
  
    // Initialize an array to hold the bike markers.
    let violenceMarkers = [];
  
    // Loop through the stations array.
    for (let index = 0; index < stations.length; index++) {
      let station = stations[index];
  
      // For each station, create a marker, and bind a popup with the station's name.
      let violenceMarker = L.marker([station.lat, station.lon])
        .bindPopup("<h3>" + station.name + "<h3><h3>Capacity: " + station.capacity + "</h3>");
  
      // Add the marker to the bikeMarkers array.
      violenceMarkers.push(violenceMarker);
    }
  
    // Create a layer group that's made from the bike markers array, and pass it to the createMap function.
    createMap(L.layerGroup(violenceMarkers));
  }

  
// a format for encoding a variety of geographic data structures 
    L.geoJson(eqData,{
    //setting the location of the data on the map
    pointToLayer:function(feature, cord){
        //Formatting the design of the data
        return L.circleMarker(cord,{
            color: depth(feature.geometry.coordinates[2]),
            fillColor: depth(feature.geometry.coordinates[2]),
            opacity: 1,
            fillOpacity: .3, 
            radius: feature.properties.mag * 10
            })
        },
        //Allowing a popup display on each displayed feature on the map
        onEachFeature: function(feature, layer){
            layer.bindPopup(`<h1>LOCATION: ${feature.properties.place.toUpperCase()},
            LATITUDE: ${feature.geometry.coordinates[1]},
            LONGITUDE: ${feature.geometry.coordinates[0]},
            MAGNITUDE: ${feature.properties.mag}</h1>`);
        }}).addTo(map);
        //Placing a legend
    control = L.control({position:"bottomright"})
    control.onAdd = function(){
        let box = L.DomUtil.create("div","legends")
        let depths = [90,70,50,30,0]

        //For loop to display labels with colors of the depth
        box.innerHTML = "<h3>Depth Measure</h3>"
        for (let d=0; d < depths.length; d++) {
            let display;

            if (d == 0){
                display = "90+"
            } else if (d == depths.length -1) {
                display = "<=30"
            }else {
                display = `${depths[d-1]}-${depths[d]}`
            }
            //connecting with the css file to set up coloration
            box.innerHTML +=`<div>
            <div class="description" style="background-color:${depth(depths[d])}"></div> ${display}
            </div>`
        }
        
        //calling the value to be displayed
        return box
    }//adding to the map so appear on the html  
    control.addTo(map);

    var chart = new CanvasJS.Chart("chartContainer", {
        title: {
            text: "Average Rental Income"
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
    
    
// Perform an API call to the Citi Bike API to get the station information. Call createMarkers when it completes.
d3.json("https://gbfs.citibikenyc.com/gbfs/en/station_information.json").then(createMarkers);

