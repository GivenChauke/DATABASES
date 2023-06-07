<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wineries</title>
    <link rel="stylesheet" href="css/indexStyle.css"/>
</head>
<body>
    <?php include ("header.php"); ?>
    <div id = "head"><h1> All available wineries</h1></div>
    <div id="container">
    </div>
    <?php
    include ('footer.php');
    ?>
    <script>
    window.onload = init;
    function init(){
        var temp = document.getElementById("wineries");
        temp.classList.add("active");
        window.addEventListener("load",()=>{
        const loader = document.querySelector(".loader");
        loader.classList.add("loader-hidden");
        loader.addEventListener("transitionend",() =>{
        loader.remove();
    })
    });
    

    //getAllwineriescode
    var req = new XMLHttpRequest();
var parem = {
    "studentnum": "u21595969", // this would be username
    "type":"GetAllWineries"
};
/**"WineryName" => $row["WineryName"],
            "City"=>$row["City"],
            "Description" => $row["Description"],
            "Website"=>$row["Website"],
            "Province"=>$row["Province"],
            "WineryId"=>$row["WineryId"] */
req.onreadystatechange = function() {
    if (req.readyState == 4 && req.status == 200) {
        var arr = JSON.parse(req.responseText);
        arr = JSON.parse(arr.data);
        var imageContainer = document.getElementById("container"); 

        for (var i = 0; i < arr.length; i++) {
            const div = document.createElement('div');

            div.setAttribute('class','winery-div');
            div.setAttribute('id',arr[i].WineryId);
            div.innerHTML+= "<p>Winery name: "+arr[i].WineryName+"<br>Province: "+arr[i].Province+"<br>Winery city: "+ 
            arr[i].City+"<br>Winery Description: "+arr[i].Description+"<br>Winery website: "+arr[i].Website+"<p>";
            imageContainer.appendChild(div);
        }
    }
};
req.open("POST", "api-1.php", true);
req.send(JSON.stringify(parem));

// Event listener for container element
var container = document.getElementById("container");
container.addEventListener('click', function(event) {
  var wineryDiv = event.target.closest('.winery-div');
  if (wineryDiv) {
    var wineID = wineryDiv.id;
    console.log("Wine ID: " + wineID);
    wineryPage(wineID);
  }
});

function wineryPage(wineID) {
  localStorage.setItem('WineryId', wineID);
  alert("winery id is: "+localStorage.getItem('WineryId'));
  window.location.href = 'wineryView.php';
}
    }
        </script>
</body>
</html>