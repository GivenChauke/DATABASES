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
        <div class = "container">
                    <form  class=" search" onsubmit = "return false">
                        <input type = "text" placeholder="search for a wine brand" name="q" id="text">
                            <button id="search"><img src="img/search.png" id = "image"></button>
                    </form>
        </div >
        <h1 align="center" id="heading">Search results:</h1>
        <?php
        include ('footer.php');
        ?>
        <script>
        window.addEventListener("load",()=>{
            const loader = document.querySelector(".loader");
            loader.classList.add("loader-hidden");
            loader.addEventListener("transitionend",() =>{
                loader.remove();
            })
        });
        </script>
</body>
</html>