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
            <label for="country">Select your Country:</label>
            <select name="country" id="country"></select>
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
            const countrySelect = document.getElementById('country');
            fetch('https://restcountries.com/v3.1/all')
            .then(response => response.json())
            .then(data => {
                data.sort((a, b) => {
                const nameA = a.name.common.toUpperCase();
                const nameB = b.name.common.toUpperCase();
                if (nameA < nameB) {
                    return -1;
                }
                if (nameA > nameB) {
                    return 1;
                }
                return 0;
                });
            data.forEach(country => {
                const option = document.createElement('option');
                option.value = country.cca2;
                option.text = country.name.common;
                countrySelect.appendChild(option);
            });
            })
            .catch(error => {
            console.error('Error fetching country data:', error);
            });
            var req = new XMLHttpRequest();
            var parem = {
                    "method":"GetAllWineries"
                };
            req.onreadystatechange = function()
            {
                if(req.readyState == 4 && req.status == 200)
                {
                    var arr = JSON.parse(req.responseText);
                    arr = arr.data;
                    console.log(arr);
                    const dropdown = document.getElementById('select');
                    for(var i =0; i < arr.length;i++)
                    {
                    dropdown.innerHTML  += "<option value="+arr[i].WineryName+">"+arr[i].WineryName+"</option>";
                    }
                    
                    
                }
            }
            req.open("POST", "api.php", true);
            req.send(JSON.stringify(parem));
            const form = document.getElementById("myForm");
            const name = document.getElementById("name");
            const surname = document.getElementById("surname");
            const email = document.getElementById("email");
            const pass = document.getElementById("password");
            const dropdown = document.getElementById('select');
            const country = document.getElementById('country');
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
            const submitForm = () => {
                /**Name, Surname, Nationality, Email, Password */
                var arr;
            console.log(dropdown.value+" "+country.value);
			var req = new XMLHttpRequest();
            var parem = {
                    "method":"signup",
                    "details":{
                        "Name":name.value,
                        "Surname":surname.value,
                        "Nationality":country.value,
                        "Email":email.value,
                        "Password":password.value,
                        "WineryName":dropdown.value
                    },
                    "manager":true
                };
            req.onreadystatechange = function()
            {
                if(req.readyState == 4 && req.status == 200)
                {
                    console.log(req.responseText);
                    arr = JSON.parse(req.responseText);
                    console.log(arr);
                    //window.location.href = 'managerView.php';
                    alert("yay");
                }
                else {
                    console.log(req.responseText);
                    arr = JSON.parse(req.responseText);
                    console.log(arr);
                    console.log("not succesful");
                }
            }
            req.open("POST", "api.php", true);
            req.send(JSON.stringify(parem));
		};
    }
	</script>
    </body>
</HTML>