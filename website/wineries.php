<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wineries</title>
</head>
<body>
        <?php include ("header.php"); ?>
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