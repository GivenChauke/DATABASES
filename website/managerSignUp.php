<!DOCTYPE HTML>
<HTML>
    <title>
        Sign-up 
    </title>
    <head>
    <link rel="stylesheet" href="css/signup.css"/>
    </head>
    <body>
        <div id = "head"><h1> Welcome to the Global Wine Store your go to wine stop for all things wine</h1></div>
        <div id = "container">
           <form id = "myForm"  >
            <label for="name">Name:</label>
            <input type="name" name="name" id="name"><br>
            <label for="surname">Surname:</label>
            <input type="surname" name="surname" id="surname"><br>
            <label for="email">Email:</label>
            <input type="email" name="email" id="email"><br> 
            <label for="password">Password:</label>
            <input type="password" name="password" id="password"><br>  
            <label for="WineryName">Winery Name:</label>
            <select name ="WineryName" id="select"></select>
            <input type="submit" value="SignUp" id="submit"><br>
            <a href="login.php" >Already have an account?</a>
            <a href="Signup.php" >Not a manager?</a>
        </form>
        </div>
        <?php
        include ('footer.php');
        ?>
        <script>
            window.onload = init;
            function init(){
            var req = new XMLHttpRequest();
            var parem = {
                    "studentnum":"u21595969",
                    "type":"GetAllWineries"
                };
            req.onreadystatechange = function()
            {
                if(req.readyState == 4 && req.status == 200)
                {
                    var arr = JSON.parse(req.responseText);
                    arr = JSON.parse(arr.data);
                    const dropdown = document.getElementById('select');
                    for(var i =0; i < arr.length;i++)
                    {
                    dropdown.innerHTML  += "<option value="+arr[i].WineryName+">"+arr[i].WineryName+"</option>";
                    }
                    
                    
                }
            }
            req.open("POST", "api-1.php", true);
            req.send(JSON.stringify(parem));
            const form = document.getElementById("myForm");
            const name = document.getElementById("name");
            const surname = document.getElementById("surname");
            const email = document.getElementById("email");
            const pass = document.getElementById("password");
           form.addEventListener('submit', (event) => {
			event.preventDefault();
			const isValid = validate();
			if (isValid) {
                window.location.href = 'index.php';
				//submitForm();
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
            if(name.value === "") 
            {
                alert("name is required!");
                return false;
            }
           if(surname.value === "") {
                alert("surname is required!");
                return false;
           }
           if (email.value === '') {
				alert('Please enter your email address');
				return false;
			} 
           else if(ValidateEmail(email.value) == false)
           {
            alert("You have entered an invalid email address!");
            return false;
           }
           if (pass.value === '') {
				alert('Please enter your password');
				return false;
			} 
            else if(validatePassword(pass.value) == false) 
           {alert("Your pass is not strong enough:\n it must be 8 characters long, contain lower and upper case letter\n and atleast one digit and symbol");
           return false;}
           return true;
           
           }
           /*const submitForm = () => {
			const xhr = new XMLHttpRequest();
			xhr.open('POST', 'signup-validation.php');
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.onload = () => {
				if (xhr.status === 200) {
					const response = JSON.parse(xhr.responseText);
                    localStorage.setItem('apikey', response.apikey);
                    localStorage.setItem('username', response.username);
                    localStorage.setItem('theme', 'light');
                    console.log(response);
					if (response.status === 'success') {
						
                        const req = new XMLHttpRequest();
                        req.open('POST', 'header.php');
                        req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                        req.onload = () => {
                            if (req.status === 200) {
                                const res = JSON.parse(req.responseText);
                                if (res.status === 'success') {
                                    alert(res.username+' registered successfully!\n Your apikey is: '+response.apikey);
                                    window.location.href = 'index.php';
                                }
                            }

                        };
                        req.send(`name=${name.value}`);
						
					}
				}
                else {
                        const response = JSON.parse(xhr.responseText);
                        console.log(response);
						alert(response.error);
					}
			};
			xhr.send(`name=${name.value}&surname=${surname.value}&email=${email.value}&password=${password.value}`);
            
		};*/
    }
	</script>
    </body>
</HTML>