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
           /*const submitForm = () => {
			const xhr = new XMLHttpRequest();
			xhr.open('POST', 'validate-login.php');
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.onload = () => {
				if (xhr.status === 200) {
					const response = JSON.parse(xhr.responseText);
                    localStorage.setItem('apikey', response.apikey);
                    localStorage.setItem('username', response.username);
                    if(response.filter != null)
                    {
                        localStorage.setItem('filter',response.filter);
                    }
                    else localStorage.setItem('filter','default');
                    if(response.css === '1')//true for dark false for light
                    {
                        localStorage.setItem('theme', 'dark');
                    }//we should get this from the response 
                    else localStorage.setItem('theme', 'light');
                    console.log(response);
					if (response.status === 'success') {
						
                        const req = new XMLHttpRequest();
                        req.open('POST', 'header.php');
                        req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                        req.onload = () => {
                            if (req.status === 200) {
                                const res = JSON.parse(req.responseText);
                                if (res.status === 'success') {
                                    alert(res.username+' logged in successfully!\n Your apikey is'+response.apikey+" theme is: " +localStorage.getItem('theme')+"user preferances "+response.filter);
                                    window.location.href = 'index.php';
                                    //set the localstorage theme to dark or light then in index check if local
                                    //dom has theme to dark to update the queryselect to dark
                                }
                                
                            }

                        };
                        req.send(`name=${response.username}`);
						
					}
				}
                else {
                        const response = JSON.parse(xhr.responseText);
                        console.log(response);
						alert(response.error);
					}
			};
			xhr.send(`email=${email.value}&password=${password.value}`);
            
		};*/

	</script>
        
    </body>
</HTML>