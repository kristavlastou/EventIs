<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/image%20for%20eventIs/Screenshot%202024-12-06%20155519.png'); /* Εικόνα ως φόντο */
            background-size: cover; /* Κάλυψη ολόκληρης της οθόνης */
            background-position: center; /* Τοποθέτηση στο κέντρο */
            background-repeat: no-repeat; /* Αποφυγή επανάληψης */
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        .form-container {
            background-color: rgba(0, 0, 0, 0.7); /* Διαφανές μαύρο για αντίθεση */
            padding: 20px;
            border-radius: 10px;
            width: 300px;
        }

        .form-container h1 {
            font-size: 2.5em; /* Μεγάλο μέγεθος γραμματοσειράς */
            margin: 0;
        }

        .form-container input[type="text"],
        .form-container input[type="password"],
        .form-container input[type="number"],
        .form-container input[type="submit"] {
            width: calc(100% - 20px); /* Μείωση πλάτους για να προστεθεί κενό */
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            box-sizing: border-box; /* Για να διατηρηθεί το padding */
        }

        .form-container input[type="text"],
        .form-container input[type="password"] {
            background-color: rgba(255, 255, 255, 0.979); /* Στυλ για τα πεδία */
            color: rgba(0, 0, 0, 0.7); /* Χρώμα γραμματοσειράς */
        }

        .form-container input[type="submit"] {
            background-color: #8e44ad;
            color: white;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover {
            background-color: #a569bd;
        }

        /* Προσαρμογή για κινητές συσκευές */
        @media (max-width: 768px) {
            body {
                background-size: cover; /* Προσαρμογή εικόνας για κινητά */
                background-position: center center;
            }

            .form-container {
                width: 90%; /* Αύξηση πλάτους για μικρότερες οθόνες */
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>EventIs</h1>
        <h2>Experience the moment, not just the event!</h2>
        <h2>Sign Up</h2>
        <form action="http://ism.dmst.aueb.gr/ismgroup8/signupController.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="password" name="confirm" placeholder="Confirm Password" required>
            <input type="number" name="age" placeholder="Age" required>
            <input type="text" name="email" placeholder="Email" required>
            <input type="text" list="cities" name="city" placeholder="City" required>
            <datalist id="cities">
                <option value="Athens"></option>
                <option value="Thessaloniki"></option>
                <option value="Patra"></option>
                <option value="Ioannina"></option>
                <option value="Chania"></option>
                <option value="Rethymno"></option>
                <option value="Volos"></option>
            </datalist>
            <input type="submit" value="Sign Up">
        </form>
    </div>
</body>
</html>
