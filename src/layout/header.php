<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />

    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.css" rel="stylesheet" />

    <!-- Preconnect for Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playwrite+DE+Grund:wght@100..400&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="src/style.css">

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Font Awesome JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.js"></script>

    <!-- Bootstrap JS (bundle includes Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <style>
        .nav .active {
            transition: all .15s ease;
            border-radius: 12px;
            background-color: var(--third-color);
            color: var(--secondary-color) !important;
        }

        .scrolled {
            background-color: #F7DC6F;
        }

        .scrolled .active {
            background-color: var(--third-color);
        }

        .nav-link:hover {
            color: #5DADE2 !important;
        }

        .modal-backdrop {
            z-index: -999;
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
                    <li class="nav-item nav-link dropdown-toggle hover:cursor-pointer flex items-center" id="dropdown 2" aria-expanded="false">
                        Thực đơn
                        <ul class="dropdown-menu">
                            <?php
                            $query = "SELECT * FROM menuitems GROUP BY item_category ORDER BY item_category ASC";
                            $result = $conn->query($query);
                            while ($row = $result->fetch_assoc()) {
                                echo "<li><a class='dropdown-item' href='index.php?menu='>" . $row['item_category'] . "</a></li>";
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