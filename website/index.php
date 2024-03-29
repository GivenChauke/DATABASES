<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HomePage</title>
        <link rel="stylesheet" href="css/indexStyle.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
    </head>
    <body>
        <?php include ("header.php"); ?>
        <div id = "head"><h1> All wines available</h1></div>
        <div id="sort">
        <h2>Sort wines by</h2>
        <div class="sort-options">
            <select id="sort-select">
            <option value="price">Price</option>
            <option value="AverageRating">Rating</option>
            <option value="type">Wine Type</option>
            </select>
            <button id="sort-button">Sort</button>
        </div>
        </div>
        <div id="container"></div>
        <?php
        include ('footer.php');
        ?>
        <script>
  var temp = document.getElementById("index");
temp.classList.add("active");
window.onload = init;
function init(){
console.log(localStorage.getItem('TouristId'));
var req = new XMLHttpRequest();
var parem = {
    "method": "GetAllWines"
};
req.onreadystatechange = function() {
    if (req.readyState == 4 && req.status == 200) {
        var arr = JSON.parse(req.responseText);
        arr = arr.data;
        var imageContainer = document.getElementById("container"); 

        for (var i = 0; i < arr.length; i++) {
            const div = document.createElement('span');
            const img = document.createElement('img');
            img.setAttribute('src', arr[i].ImageURL);
            img.classList.add('wines'); 
            img.style.width = '250px'; 
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
req.open("POST", "api.php", true);
req.send(JSON.stringify(parem));

const sortButton = document.getElementById("sort-button");
const sortSelect = document.getElementById('sort-select');
sortButton.addEventListener('click', sortWines);

  function sortWines() {
    const sortBy = sortSelect.value;
    console.log('Sorting by price');///api request
          var req = new XMLHttpRequest();
var parem = {
    "method": "GetAllWines",
    "sort":sortBy
};
req.onreadystatechange = function() {
    if (req.readyState == 4 && req.status == 200) {
        var arr = JSON.parse(req.responseText);
        arr = arr.data;
        var imageContainer = document.getElementById("container"); 
        imageContainer.innerHTML="";
        for (var i = 0; i < arr.length; i++) {
            const div = document.createElement('span');
            const img = document.createElement('img');
            img.setAttribute('src', arr[i].ImageURL);
            img.classList.add('wines'); 
            img.style.width = '250px'; 
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
req.open("POST", "api.php", true);
req.send(JSON.stringify(parem));
       
  }
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
    var req = new XMLHttpRequest();
var parem = {
    "method": "rating",
    "TouristID":localStorage.getItem('TouristId'),
    "WineID":WineID,
    "Rating":checked
};
req.onreadystatechange = function() {
    if (req.readyState == 4 && req.status == 200) {
        alert("wine with wineid "+WineID+" rated with "+checked);
    }
};
req.open("POST", "api.php", true);
req.send(JSON.stringify(parem));
  }


  }
    }
        </script>
    </body>
</html>