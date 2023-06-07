<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Wines</title>
    <link rel="stylesheet" href="css/indexStyle.css"/>
</head>
<body>
<?php include ("header.php"); ?>
    <div id = "head"><h1>Advanced wine search</h1></div>
    <div id = "search-container">
    <form class="search">
    <label for="WineName" class="search">Select a Wine Name:</label>
    <select name="WineName" id="select-WineName"></select>
    <label for="city" class="search">City:</label>
    <select name ="city" id="select-city"></select>
    <label for="wineType" class="search">Select Wine type:</label>
    <select name ="WineType" id="select-wineType"></select>
    <label for="year" class="search">Year from:</label>
    <select name ="year" id="select-yearFrom"></select>
    <label for="grapeVariety" class="search">Grape variety:</label>
    <select name ="grapeVariety" id="select-grapeVariety"></select>
    <button id="searchButton">Search</button>
    </form>
    </div >
    <h2>Search results:</h2>
    <div id="container">
        <h3>Recommended results based on your location</h3>
    </div>
    <?php
    include ('footer.php');
    ?>
    <script>
    window.onload = init;
    function init(){
    var temp = document.getElementById("Search");
    temp.classList.add("active");
    window.addEventListener("load",()=>{
        const loader = document.querySelector(".loader");
        loader.classList.add("loader-hidden");
        loader.addEventListener("transitionend",() =>{
            loader.remove();
        })
    });
    //getAllwines to populate select
    var req = new XMLHttpRequest();
    var parem = {
            "method":"GetAllWines"
        };
    req.onreadystatechange = function()
    {
        if(req.readyState == 4 && req.status == 200)
        {
            var arr = JSON.parse(req.responseText);
            arr = arr.data;
            const dropdown = document.querySelectorAll('select')
            for(var i =0; i < arr.length;i++)
            {
            dropdown[0].innerHTML  += "<option value="+arr[i].WineName+">"+arr[i].WineName+"</option>";
            dropdown[1].innerHTML  += "<option value="+arr[i].Region+">"+arr[i].Region+"</option>";
            dropdown[2].innerHTML  += "<option value="+arr[i].Type+">"+arr[i].Type+"</option>";
            dropdown[3].innerHTML  += "<option value="+arr[i].Vintage+">"+arr[i].Vintage+"</option>";
            dropdown[4].innerHTML  += "<option value="+arr[i].GrapeVariety+">"+arr[i].GrapeVariety+"</option>";
            }
            
            
        }
    }
    req.open("POST", "api.php", true);
    req.send(JSON.stringify(parem));

const searchButton = document.getElementById("searchButton");
searchButton.addEventListener('click', request);

function request() {
  const wineName = document.getElementById('select-WineName').value;
  const city = document.getElementById('select-city').value;
  const wineType = document.getElementById('select-wineType').value;
  const yearFrom = document.getElementById('select-yearFrom').value;
  const grapeVariety = document.getElementById('select-grapeVariety').value;

  const requestBody = {
    "method": "GetAllWines",
    "search":{
    }
  };

  if (wineName) {
  requestBody.search.wineName = wineName;
}

if (city) {
  requestBody.search.Region = city;
}

if (wineType) {
  requestBody.search.Type = wineType;
}

if (yearFrom) {
  requestBody.search.Vintage = yearFrom;
}
  var arr;
  const imageContainer = document.getElementById('container');
  imageContainer.innerHTML="";
  const req = new XMLHttpRequest();
  req.onreadystatechange = function() {
    if (req.readyState == 4 && req.status == 200) {
      var response = JSON.parse(req.responseText);
      arr = response.data;
      for (var i = 0; i < arr.length; i++) {
      const div = document.createElement('span');
      const img = document.createElement('img');
      img.setAttribute('src', arr[i].ImageURL);
      img.classList.add('wines');
      img.style.width = '300px';
      img.style.height = '200px';

      div.setAttribute('id', 'span');
      div.appendChild(img);
      div.innerHTML += "<p>Wine name: " + arr[i].WineName + "<br>Price: " + arr[i].Price + "<br>Wine type: " +
      arr[i].Type + "<br>Region: " + arr[i].Region + "<br>Rating: " + arr[i].AverageRating + "<br> Rate wine" + "<p>";

      imageContainer.appendChild(div);}
    }
  };
  req.open("POST", "api.php", true);
  req.send(JSON.stringify(requestBody));
}
suggestWinesByLocation();
//search based on location///
function suggestWinesByLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
  } else {
    console.log("Geolocation is not supported by this browser.");
  }
}

function successCallback(position) {
  const latitude = position.coords.latitude;
  const longitude = position.coords.longitude;
console.log("location of user is: "+latitude+" "+longitude);
getCityName(-33.932106,18.860151);
}

function errorCallback(error) {
  console.log("Error retrieving geolocation:", error);
}
function getCityName(latitude, longitude) {
  var cities;
  const xhr = new XMLHttpRequest();
  xhr.withCredentials = true;
  xhr.addEventListener('readystatechange', function() {
    if (this.readyState === this.DONE) {
      console.log(this.responseText);
      const response = JSON.parse(this.responseText);
      console.log(response.data);
      cities = response.data;
      if (response.data && response.data.length > 0) {
        const city = response.data[0].city;
        console.log("City:", city);
        console.log("testing cities: "+cities[0].city);
        // Call your API with the city name to suggest wines based on location
        // Example:
        const requestBody = {
          "method": "GetAllWines"
        };

        // Make an API request using the city name to suggest wines based on location
        const imageContainer = document.getElementById('container');
        
        const req = new XMLHttpRequest();
        req.onreadystatechange = function() {
          if (req.readyState == 4 && req.status == 200) {
            var arr = JSON.parse(req.responseText);
            arr = arr.data;
            const dropdown = document.querySelectorAll('select')
            for (var i = 0; i < arr.length; i++) {
                const region = arr[i].Region;
                if(cities.some(c => c.city === region)) {
                const div = document.createElement('span');
                const img = document.createElement('img');
                img.setAttribute('src', arr[i].ImageURL);
                img.classList.add('wines');
                img.style.width = '300px';
                img.style.height = '200px';

                div.setAttribute('id', 'span');
                div.appendChild(img);
                div.innerHTML += "<p>Wine name: " + arr[i].WineName + "<br>Price: " + arr[i].Price + "<br>Wine type: " +
                  arr[i].Type + "<br>Region: " + arr[i].Region + "<br>Rating: " + arr[i].AverageRating + "<br> Rate wine" + "<p>";

                imageContainer.appendChild(div);
              }
            }
          }
        };
        req.open("POST", "api.php", true);
        req.send(JSON.stringify(requestBody));
      } else {
        console.log("Unable to retrieve city name for the coordinates:", latitude, longitude);
      }
    }
  });

  xhr.open('GET', `https://wft-geo-db.p.rapidapi.com/v1/geo/locations/${latitude}+${longitude}/nearbyCities?radius=100`);
  xhr.setRequestHeader('X-RapidAPI-Key', 'c80078e115mshda11279471fdefep1c6129jsn4cb7175dc57c');
  xhr.setRequestHeader('X-RapidAPI-Host', 'wft-geo-db.p.rapidapi.com');
  xhr.send();
}


/*
const latitude = 40.7128; // Example latitude
const longitude = -74.0060; // Example longitude
getCityName(latitude, longitude);*/
}
    </script>
</body>
</html>