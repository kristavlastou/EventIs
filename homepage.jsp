<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session = "true" %>

<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }




        .grid-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr); 
            gap: 20px;
            padding: 20px;
            background-color:#6a0dad;
        }

        .grid-item {
            height: 150px; 
            background-size: cover; 
            background-position: center; 
            color: white;
            font-size: 1.5em;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            cursor: pointer;
            position: relative; 
            overflow: hidden; 
        }
        
        .grid-item-1 {
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/party.jpg'); 
        }
        .grid-item-2 {
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/conserts.jpg'); 
        }

        .grid-item-3 {
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/theatre.jpg');
        }

        .grid-item-4 {
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/cinema.jpg'); 
        }

        .grid-item-5 {
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/festivals.jpg'); 
        }

        .grid-item-6 {
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/art.jpg'); 
        }

        .grid-item-7 {
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/performance.jpg'); 
        }

        .grid-item-8 {
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/sports.jpg'); 
        }


        .grid-item a {
            color: white;
            text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .item-text {
            position: absolute;
            bottom: 10px; 
            left: 10px; 
            right: 10px; 
            font-size: 1.2em; 
            background-color: rgba(0, 0, 0, 0.5); 
            padding: 5px; 
            border-radius: 5px; 
            text-align: center; 
        }
        @media (max-width: 768px) { 

            .grid-container {
                margin-top: 60px  !important; 
            }

        }



    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <%@ include file = "navbar.jsp" %>
    <div class="grid-container">
        <div class="grid-item grid-item-1">
            <span class="item-text">Party</span> 
            <a href="http://ism.dmst.aueb.gr/ismgroup8/category.jsp?category=Party"></a>
        </div>
        <div class="grid-item grid-item-2">
            <span class="item-text">Concert</span> 
            <a href="http://ism.dmst.aueb.gr/ismgroup8/category.jsp?category=Concert"></a>
        </div>
        <div class="grid-item grid-item-3">
            <span class="item-text">Theatre</span> 
            <a href="http://ism.dmst.aueb.gr/ismgroup8/category.jsp?category=Theatre"></a>
        </div>
        <div class="grid-item grid-item-4">
            <span class="item-text">Cinema</span> 
            <a href="http://ism.dmst.aueb.gr/ismgroup8/category.jsp?category=Cinema"></a>
        </div>
        <div class="grid-item grid-item-5">
            <span class="item-text">Festival</span> 
            <a href="http://ism.dmst.aueb.gr/ismgroup8/category.jsp?category=Festival"></a>
        </div>
        <div class="grid-item grid-item-6">
            <span class="item-text">Exhibition</span> 
            <a href="http://ism.dmst.aueb.gr/ismgroup8/category.jsp?category=Exhibition"></a>
        </div>
        <div class="grid-item grid-item-7">
            <span class="item-text">Show</span> 
            <a href="http://ism.dmst.aueb.gr/ismgroup8/category.jsp?category=Show"></a>
        </div>
        <div class="grid-item grid-item-8">
            <span class="item-text">Sport</span> 
            <a href="http://ism.dmst.aueb.gr/ismgroup8/category.jsp?category=Sport"></a>
        </div>
    </div>


   
</body>
</html>