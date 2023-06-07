<!DOCTYPE HTML>
<HTML>
    <title>
    Login
    </title>
    <head>
    <link rel="stylesheet" href="css/signup.css"/>
    </head>
    <body>
        <div id = "head"><h1> Welcome back to the Global Wine Store your go to wine stop for all things wine</h1></div>
        <div id = "container">
           <form id = "myForm"  >
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" placeholder="Email address"><br> 
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" placeholder="Password"> 
            <h2 >Are you a manager: </h2>
            <select id="select">
            <option value="NO">NO</option>
            <option value="YES">YES</option>
            </select>        
            <input type="submit" value="LOGIN" id="submit"><br>
            <a href="signup.php" >Create new account</a>
        </form>
        </div>
        <?php
        include ('footer.php');
        ?>
        <script>
            const form = document.getElementById("myForm");
            const email = document.getElementById("email");
            const pass = document.getElementById("password");
            const select = document.getElementById("select");
           form.addEventListener('submit', (event) => {
			event.preventDefault();
			const isValid = validate();
			if (isValid) {
                submitForm();
			}
		    });
           function ValidateEmail(inputText)
            {
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if(inputText.match(mailformat))
                { return true;
                }
                else
                { return false;
                }
            }
            function validatePassword(password){
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)[a-zA-Z\d\W]{8,}$/;
            if (passwordRegex.test(password)) {
            return true;
            } else {
            return false;
            }
        }
           function validate(){
           if (email.value === '') {
				alert('Please enter your email address');
				return false;
			} 
           else if(ValidateEmail(email.value) == false)
           {
            alert("You have entered an invalid email address!");
            return false;
           }
           console.log(pass.value);
           if (pass.value === '') {
				alert('Please enter your password');
				return false;
			} 
            else if(validatePassword(pass.value) == false) 
           {alert("Your pass is not strong enough:\n it must be 8 characters long, contain lower and upper case letter\n and atleast one digit and symbol");
           return false;}
           return true;
           
           }
           const submitForm = () => {
			var arr;
            var temp;
            if(select.value==="YES") temp = true;
            else temp = false;
			var req = new XMLHttpRequest();
            var parem = {
                    "method":"login",
                    "details":{
                        "Email":email.value,
                        "Password":password.value
                    },
                    "manager":temp
                };
            req.onreadystatechange = function()
            {
                if(req.readyState == 4 && req.status == 200)
                {
                    arr = JSON.parse(req.responseText);
                    console.log(arr);
                    alert(arr.message);
                    localStorage.setItem('TouristId', arr.details.TouristID);
                    alert(arr.details.TouristID);
                    window.location.href = 'index.php';
                }
                else {
                    arr = JSON.parse(req.responseText);
                    alert(arr.message);
                }
            }
            req.open("POST", "api.php", true);
            req.send(JSON.stringify(parem));
            
		};

	</script>
        
    </body>
</HTML>