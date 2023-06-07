<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wineryView</title>
    <link rel="stylesheet" href="css/indexStyle.css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
</head>
<body>
    <?php include ("header.php"); ?>
    <div id = "head"><h1> All wines available in the winery</h1></div>
    <div id="container">
    <div id="winery-details"></div>
    <div id="wine-images"></div>
    </div>
    <?php
    include ('footer.php');
    ?>
    <script>
    console.log(localStorage.getItem('WineryId'));
    var wineryId = localStorage.getItem('WineryId');

// Request to get winery details
var wineryReq = new XMLHttpRequest();
var wineryParams = {
  "studentnum": "u21595969",
  "type":"GetAllWineries"
};
wineryReq.onreadystatechange = function() {
  if (wineryReq.readyState == 4 && wineryReq.status == 200) {
    var arr = JSON.parse(wineryReq.responseText);
    arr = JSON.parse(arr.data);
    for(let i = 0; i < arr.length;i++){
    if (arr[i].WineryId === wineryId) {
      displayWineryDetails(arr[i]);
    } else {
      console.log("Winery not found for ID: " + wineryId);
    }
}
  }
};
wineryReq.open("POST", "api-1.php", true);
wineryReq.send(JSON.stringify(wineryParams));

// Function to display winery details
function displayWineryDetails(winery) {
  var wineryDiv = document.getElementById('winery-details');
  wineryDiv.innerHTML = "<h2>Winery Name: " + winery.WineryName + "</h2>" +
    "<p>Province: " + winery.Province + "</p>" +
    "<p>City: " + winery.City + "</p>" +
    "<p>Description: " + winery.Description + "</p>" +
    "<p>Website: " + winery.Website + "</p>";
}
    //separate request
    var req = new XMLHttpRequest();
var parem = {
    "studentnum": "u21595969", // request using the winery id
    "type": "GetAllWines"
};
req.onreadystatechange = function() {
    if (req.readyState == 4 && req.status == 200) {
        var arr = JSON.parse(req.responseText);
        arr = JSON.parse(arr.data);
        var imageContainer = document.getElementById("wine-images"); 

        for (var i = 0; i < arr.length; i++) {
            const div = document.createElement('span');
            const img = document.createElement('img');
            img.setAttribute('src', arr[i].ImageURL);
            img.classList.add('wines'); 
            img.style.width = '300px'; 
            img.style.height = '200px'; 

            div.setAttribute('id','span');
            div.appendChild(img);
            div.innerHTML+= "<p>Wine name: "+arr[i].WineName+"<br>Price: "+arr[i].Price+"<br>Wine type: "+ 
            arr[i].Type+"<br>Region: "+arr[i].Region+"<br>Rating: "+arr[i].AverageRating+"<br> Rate wine"+"<p>";
            
            //code for rating system
            const ratingClass = document.createElement('div');
            ratingClass.classList.add('rating');

            const star = document.createElement('input');
            star.setAttribute('type', 'radio');
            star.setAttribute('id', 'star' + i);
            star.setAttribute('class',arr[i].WineID);
            const label = document.createElement('label');
            label.setAttribute('for', 'star' + i);
            label.classList.add("fas", "fa-star");
            ratingClass.appendChild(star);
            ratingClass.appendChild(label);

            const star1 = document.createElement('input');
            star1.setAttribute('type', 'radio');
            star1.setAttribute('id', 'star1' + i);
            star1.setAttribute('class',arr[i].WineID);
            const label1 = document.createElement('label');
            label1.setAttribute('for', 'star1' + i);
            label1.classList.add("fas", "fa-star");
            ratingClass.appendChild(star1);
            ratingClass.appendChild(label1);

            const star2 = document.createElement('input');
            star2.setAttribute('type', 'radio');
            star2.setAttribute('id', 'star2' + i);
            star2.setAttribute('class',arr[i].WineID);
            const label2 = document.createElement('label');
            label2.setAttribute('for', 'star2' + i);
            label2.classList.add("fas", "fa-star");
            ratingClass.appendChild(star2);
            ratingClass.appendChild(label2);

            const star3 = document.createElement('input');
            star3.setAttribute('type', 'radio');
            star3.setAttribute('id', 'star3' + i);
            star3.setAttribute('class',arr[i].WineID);
            const label3 = document.createElement('label');
            label3.setAttribute('for', 'star3' + i);
            label3.classList.add("fas", "fa-star");
            ratingClass.appendChild(star3);
            ratingClass.appendChild(label3);

            const star4 = document.createElement('input');
            star4.setAttribute('type', 'radio');
            star4.setAttribute('id', 'star4' + i);
            star4.setAttribute('class',arr[i].WineID);
            const label4 = document.createElement('label');
            label4.setAttribute('for', 'star4' + i);
            label4.classList.add("fas", "fa-star");
            ratingClass.appendChild(star4);
            ratingClass.appendChild(label4);

            const button = document.createElement('button');
            button.setAttribute('class', 'ratingButton');
            button.setAttribute('id',arr[i].WineID);
            button.textContent = 'Submit Rating';
            
           div.appendChild(ratingClass);
           div.appendChild(button);
           imageContainer.appendChild(div);
        }
    }
};
req.open("POST", "api-1.php", true);
req.send(JSON.stringify(parem));

//rating code//
document.addEventListener('click', function(event) {
  if (event.target.classList.contains('ratingButton')) {
    const wineID = event.target.id;
    submitRatings(wineID);
  }
});
  function submitRatings(WineID)
  {
    console.log("picture of wineID: "+WineID+" got rated");
    const stars = document.getElementsByClassName(WineID);
    let checked = 0; console.log("stars length: "+stars.length);
    for (var i = 1; i < stars.length; i++) {
      if(stars[0].checked) {checked = 5; break}
    if (stars[i].checked) {
      checked = 5-i;
      break;
    }
  }
  console.log("stars checked is: "+checked);
    var body={
      "method":"UpdateRating",
      "WineID":WineID
    }
    //api request//
  }
    </script>
</body>
</html>