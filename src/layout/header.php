<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />

    <!-- Font Awesome CSS -->
    <link href="src/css/all.css" rel="stylesheet" />

    <!-- Preconnect for Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playwrite+DE+Grund:wght@100..400&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="src/css/bootstrap.min.css" rel="stylesheet">

    <!-- Style CSS -->
    <link rel="stylesheet" href="src/css/style.css">

    <!-- Tailwind CSS -->
    <script src="src/js/tailwindcss.js"></script>

    <!-- jQuery -->
    <script src="src/js/jquery.min.js"></script>

    <!-- Chart -->
    <script src="src/js/chart.js"></script>

    <!-- Font Awesome JS -->
    <script src="src/js/all.js"></script>

    <!-- Bootstrap JS (bundle includes Popper.js) -->
    <script src="src/js/bootstrap.bundle.min.js"></script>

    <style>
        .nav .active {
            transition: all .15s ease;
            border-radius: 12px;
            background-color: var(--third-color);
            color: var(--secondary-color) !important;
        }

        .scrolled {
            background-color: rgba(162, 213, 242, 0.7);
        }

        .scrolled .active {
            background-color: var(--third-color);
        }

        .nav-link:hover {
            color: var(--secondary-color) !important;
        }

        .modal-backdrop {
            z-index: -999;
        }

        .nav-item {
            position: relative;
        }

        .nav-link::after {
            position: absolute;
            content: "";
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            background-color: var(--third-color);
            scale: 1 0;
            z-index: -1;
            transition: 0.45s;
            border-radius: 10px;
        }

        .nav-link:hover::after {
            scale: 1 1;
        }

        .dropdown:hover .dropdown-list {
            display: block;
        }

        .dropdown-list {
            display: none;
        }
    </style>
</head>

<body style="scroll-behavior: smooth; font-family: 'Playwrite DE Grund', cursive; background-color: #A2D5F2;">
    <header class="fixed w-full top-0 z-10">
        <div class="container mx-auto px-6">
            <div class="flex justify-between items-center py-3">
                <a href="index.php">
                    <!-- <img alt="Logo" height="80" width="80" src="images/logo.png" class="rounded-full" /> -->
                    <h1 class="text-3xl tracking-widest font-black hover:underline">FIREFLIES</h1>
                </a>
                <ul class="space-x-4 text-base nav">
                    <li class="nav-item"><a class="nav-link" id="home" href="index.php"> Trang chủ </a></li>
                    <li class="nav-item dropdown">
                        <a href="index.php?p=menuitems" class="nav-link " id="menuitems">Thực đơn</a>
                        <ul class="dropdown-list absolute top-full w-full bg-slate-200 rounded-md py-1">
                            <?php
                            $query = "SELECT * FROM dish GROUP BY dishCategory ORDER BY dishCategory ASC";
                            $result = $conn->query($query);
                            while ($row = $result->fetch_assoc()) {
                                echo "<li class='dropdown-item py-1 px-2 hover:bg-slate-100'><a class='dropdown-link' href='index.php?menu='>" . $row["dishCategory"] . "</a></li>";
                            }
                            ?>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" id="discount" href="index.php?p=discount"> Khuyến mãi </a></li>
                    <li class="nav-item"><a class="nav-link" id="partyorder" href="index.php?p=partyorder"> Dịch vụ </a></li>
                    <li class="nav-item"><a class="nav-link" id="info" href="index.php?p=info"> Giới thiệu </a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#cartModal" id="cart" title="Giỏ hàng">
                            <i class="fas fa-shopping-cart text-xl"> </i></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" id="user" href="#" data-bs-toggle="modal" data-bs-target="#userModal" title="Tài khoản">
                            <i class="fas fa-user text-xl"> </i></a>
                    </li>
                </ul>
            </div>
    </header>

    <div class="modal modalCart fade" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title fs-5 font-bold text-3xl" id="cartModalLabel" style="color: #E67E22;">Giỏ hàng</h2>
                </div>
                <div class=" modal-body">
                    <p>Chưa có sản phẩm nào</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-danger">Thanh toán</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal modalUser fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title fs-5 font-bold text-3xl" id="cartModalLabel" style="color: #E67E22;">Đăng nhập</h2>
                </div>
                <div class="modal-body">
                    <form action="" class="form-container w-full">
                        <label for="email" class="w-full py-2"><b>Email</b></label>
                        <input type="text" class="w-full form-control" placeholder="Địa chỉ email" name="email" required>

                        <label for="psw" class="w-full py-2"><b>Password</b></label>
                        <input type="password" class="w-full form-control" placeholder="Mật khẩu" name="psw" required>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                </div>
            </div>
        </div>
    </div>