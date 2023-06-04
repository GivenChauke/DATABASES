<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HomePage</title>
        <link rel="stylesheet" href="css/indexStyle.css"/>
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
            div.innerHTML+= "<p>Wine name: "+arr[i].WineName+"<br>Price: "+arr[i].Price+"<br>Wine type: "+ arr[i].Type+"<br>Region: "+arr[i].Region+"<p>";
            imageContainer.appendChild(div);
        }
    }
};
req.open("POST", "api-1.php", true);
req.send(JSON.stringify(parem));}
        </script>
    </body>
</html>