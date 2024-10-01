<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Quản lý cửa hàng</title>
    <link rel="shortcut icon" href="../../../images/logo.png" type="image/x-icon" />

    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.css" rel="stylesheet" />

    <!-- Preconnect for Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playwrite+DE+Grund:wght@100..400&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Chart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Font Awesome JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.js"></script>

    <!-- Bootstrap JS (bundle includes Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <style>
        .activeAd {
            background-color: rgb(55 65 81);
            color: #FFF !important;
        }
    
        .subnav {
            display: none;
        }

        .user-container:hover .subnav {
            display: inline-block;
            width: 150px;
        }


        #calendar {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 10px;
            margin: 20px 0;
        }

        .day {
            border: 1px solid #ccc;
            padding: 20px;
            position: relative;
            cursor: pointer;
        }

        .dot {
            width: 10px;
            height: 10px;
            background-color: orange;
            border-radius: 50%;
            position: absolute;
            bottom: 10px;
            right: 10px;
            display: none;
        }

        .hidden {
            display: none;
        }

        #info {
            border: 1px solid #ccc;
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<?php
session_start();
$conn = new mysqli("localhost", "root", "", "fireflies");

if (isset($_POST["btnxem"])) {
    $_SESSION["startM"] = $_POST["startM"];
    $_SESSION["endM"] = $_POST["endM"];

    $daystart = explode("-", $_SESSION["startM"]);
    $startM = implode("-", array($daystart[0], $daystart[1], $daystart[2]));
    $dayend = explode("-", $_SESSION["endM"]);
    $endM = implode("-", array($dayend[0], $dayend[1], $dayend[2]));
} else {
    $startM = date("Y-m-01");
    $endM = date("Y-m-t");
}

$startW = date("Y-m-d", strtotime("monday this week"));
$endW = date("Y-m-d", strtotime("sunday this week"));
?>

<body class="bg-gray-100" style="scroll-behavior: smooth; font-family: 'Playwrite DE Grund', cursive;">
    <div class="flex flex-col md:flex-row">
        <div class="bg-gray-900 w-full h-screen md:w-64">
            <div class="flex items-center justify-center h-16 bg-gray-800">
                <a href="index.php"><span class="text-white text-2xl font-semibold">Fireflies</span></a>
            </div>
            <nav class="mt-10">
                <a class="flex items-center py-2 px-8 text-gray-400 hover:bg-gray-700 hover:text-white adnav" id="admin" href="index.php">
                    <i class="fas fa-tachometer-alt mr-3"></i>Tổng quan
                </a>
                <a class="flex items-center py-2 px-8 text-gray-400 hover:bg-gray-700 hover:text-white adnav" id="employee" href="index.php?i=employee">
                    <i class="fa-solid fa-users-gear mr-3"></i></i>Quản lý nhân viên
                </a>
                <a class="flex items-center py-2 px-8 text-gray-400 hover:bg-gray-700 hover:text-white adnav" id="menu" href="index.php?i=menu">
                    <i class="fa-solid fa-utensils mr-3"></i>Quản lý món
                </a>
                <a class="flex items-center py-2 px-8 text-gray-400 hover:bg-gray-700 hover:text-white adnav" id="revenue" href="index.php?i=revenue">
                    <i class="fa-solid fa-file-invoice-dollar mr-3"></i>Doanh thu
                </a>
                <a class="flex items-center py-2 px-8 text-gray-400 hover:bg-gray-700 hover:text-white adnav" id="workshift" href="index.php?i=workshift">
                    <i class="fa-regular fa-calendar-days mr-3"></i>Lịch làm việc
                </a>
                <a class="flex items-center py-2 px-8 text-gray-400 hover:bg-gray-700 hover:text-white adnav" id="attendance" href="index.php?i=attendance">
                    <i class="fa-solid fa-clock mr-3"></i>Bảng chấm công
                </a>
            </nav>
        </div>


        <?php
        $i = "";
        if (isset($_REQUEST["i"])) {
            $i = $_REQUEST["i"];
        } else {
            $i = "home";
        }

        if ($i != "home") {
            require("" . $_REQUEST["i"] . "/index.php");
        } else {
            require("home/index.php");
        }
        ?>
    </div>
    <!-- Footer -->
    <footer class="mt-6 text-center text-gray-500 text-sm">
        <p>&copy; 2024 | made with by Fireflies</p>
    </footer>
    </div>
    </div>

    <script>
        const navAd = document.querySelectorAll(".adnav");
        let idActiveAd = "admin";


        navAd.forEach(function(item) {
            item.addEventListener("click", () => {
                navAd.forEach((i) => i.classList.remove("activeAd"));
            });
        });

        if (window.location.search != "")
            idActiveAd = window.location.search.slice(3);

        window.addEventListener("load", () => {
            navAd.forEach(function(item) {
                if (item.id == idActiveAd) item.classList.add("activeAd");
                else item.classList.remove("activeAd");
            });
            console.log(idActiveAd);
        });
    </script>
</body>

</html>