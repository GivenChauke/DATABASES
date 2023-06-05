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
        <div id="container"></div>
        <?php
        include ('footer.php');
        ?>
        <script>
window.onload = init;
function init(){
var temp = document.getElementById("index");
temp.classList.add("active");
 window.addEventListener("load",()=>{
    const loader = document.querySelector(".loader");
    loader.classList.add("loader-hidden");
    loader.addEventListener("transitionend",() =>{
        loader.remove();
    })
});

var req = new XMLHttpRequest();
var parem = {
    "studentnum": "u21595969", // this would be username
    "type": "GetAllCars",
    "limit": 100,
    "return": "*"
};
req.onreadystatechange = function() {
    if (req.readyState == 4 && req.status == 200) {
        var arr = JSON.parse(req.responseText);
        arr = JSON.parse(arr.data);
        var imageContainer = document.getElementById("container"); 

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
            arr[i].Type+"<br>Region: "+arr[i].Region+"<br>Rating: "+arr[i].AverageRating+"<p>";
            
            //code for rating system
            const ratingClass = document.createElement('div');
            ratingClass.classList.add('rating');

            const star = document.createElement('input');
            star.setAttribute('type', 'radio');
            star.setAttribute('id', 'star' + i);
            const label = document.createElement('label');
            label.setAttribute('for', 'star' + i);
            label.classList.add("fas", "fa-star");
            ratingClass.appendChild(star);
            ratingClass.appendChild(label);

            const star1 = document.createElement('input');
            star1.setAttribute('type', 'radio');
            star1.setAttribute('id', 'star1' + i);
            const label1 = document.createElement('label');
            label1.setAttribute('for', 'star1' + i);
            label1.classList.add("fas", "fa-star");
            ratingClass.appendChild(star1);
            ratingClass.appendChild(label1);

            const star2 = document.createElement('input');
            star2.setAttribute('type', 'radio');
            star2.setAttribute('id', 'star2' + i);
            const label2 = document.createElement('label');
            label2.setAttribute('for', 'star2' + i);
            label2.classList.add("fas", "fa-star");
            ratingClass.appendChild(star2);
            ratingClass.appendChild(label2);

            const star3 = document.createElement('input');
            star3.setAttribute('type', 'radio');
            star3.setAttribute('id', 'star3' + i);
            const label3 = document.createElement('label');
            label3.setAttribute('for', 'star3' + i);
            label3.classList.add("fas", "fa-star");
            ratingClass.appendChild(star3);
            ratingClass.appendChild(label3);

            const star4 = document.createElement('input');
            star4.setAttribute('type', 'radio');
            star4.setAttribute('id', 'star4' + i);
            const label4 = document.createElement('label');
            label4.setAttribute('for', 'star4' + i);
            label4.classList.add("fas", "fa-star");
            ratingClass.appendChild(star4);
            ratingClass.appendChild(label4);

           div.appendChild(ratingClass);
           imageContainer.appendChild(div);
        }
    }
};
req.open("POST", "api-1.php", true);
req.send(JSON.stringify(parem));}
        </script>
    </body>
</html>