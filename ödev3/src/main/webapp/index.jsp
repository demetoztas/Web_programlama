<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <script>
        function showMessage(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <h2> KULLANICI KAYIT FORMU</h2>
    <form action="UserRegister" method="post">
        <label for="name">AD:</label><br>
        <input type="text" id="name" name="name"><br>
        <label for="surname">SOYAD:</label><br>
        <input type="text" id="surname" name="surname"><br>
        <label for="email">EPOSTA:</label><br>
        <input type="email" id="email" name="email"><br>
        <label for="password">SIFRE:</label><br>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="KAYDET">
    </form>
</body>
</html>
