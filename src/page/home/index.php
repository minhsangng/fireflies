<title>Trang chủ | FireFlies - Chuỗi cửa hàng thức ăn nhanh</title>

<style>
  .container form {
    min-height: 100% !important;
  }
</style>

<main class="container px-4">
  <form action="" method="post" class="form-search">
    <section class="content-home flex justify-center mx-auto items-center flex-col text-white">
      <h1 class="text-center my-4 leading-relaxed text-5xl">THÈM MÓN GÌ, <br> <span id="text">NGẠI CHI MÀ KHÔNG NÓI?</span></h1>
      <div class="content w-full flex justify-center text-xl">
        <div class="btn-search flex justify-center items-center input-group w-2/5 h-14 mr-3">
          <input type="search" name="search" id="" class="form-control h-14 pl-8 text-xl" autocomplete="false" value="<?php echo $_POST['search']; ?>">
          <span class="input-group-text h-full px-10"><i class="fa-solid fa-magnifying-glass text-xl"></i></span>
        </div>
        <button type="submit" class="btn btn-primary btn-search ml-3 px-8 text-xl font-bold" name="btn">Tìm</button>
      </div>
    </section>
  </form>

  <?php
  session_start();

  $input = "";
  if (isset($_REQUEST["btn"])) {
    $input = $_POST["search"];

    if ($input != "") {
      echo "<script>document.querySelector('.content-home').style.height = '45vh';</script>";
      $sql = "SELECT * FROM dish WHERE dishName LIKE '%" . $input . "%'";
      $result = $conn->query($sql);
      $n = $result->num_rows;

      echo "<section class='output-search border-t border-gray-500 my-16' id='search-output'>
            <h2 class='border-b border-gray-500 text-2xl font-bold px-2 py-4'>KẾT QUẢ DÀNH CHO: " . $input . "</h2>";

      if ($n > 0) {
        echo "<div class='grid grid-cols-3 gap-x-14 gap-y-10 my-4'>";
        while ($row = $result->fetch_assoc()) {
          echo "
                <div class='card w-full'>
                  <a href='?i=".$row["dishID"]."'>
                    <img src='images/dish/" . $row["image"] . "' class='card-img-top h-64' alt=''>
                    <div class='card-body flex justify-between items-center'>
                      <h5 class='card-title font-bold'>" . $row["dishName"] . "</h5>
                      <a href='#' class='btn btn-outline-info'>Xem thêm</a>
                    </div>
                  </a>
              </div>
              ";
        }
        echo "</div>";
      } else {
        echo "<div class='grid w-full my-4'><h5 class='font-bold'>Xin lỗi! Chúng tôi không tìm thấy kết quả bạn cần!</h5></div>";
        $_POST["search"] = "";
      }
      echo "</section>";
    }
  } else
    $_POST["search"] = "";
  ?>

  <section class="products border-t border-gray-500 my-16">
    <h2 class="border-b border-gray-500 text-2xl font-bold px-2 py-4">DANH MỤC SẢN PHẨM</h2>
    <div class="content-product grid grid-cols-3 gap-x-14 gap-y-10 my-4">
      <?php
      $sql = "SELECT * FROM dish GROUP BY dishCategory ORDER BY dishCategory ASC";
      $result = $conn->query($sql);

      while ($row = $result->fetch_assoc()) {
        echo "
          <div class='card w-full'>
            <a href='?i=".$row["dishCategory"] . "'>
              <img src='images/dish/" . $row["image"] . "' class='card-img-top h-64' alt=''>
              <div class='card-body flex justify-between items-center'>
                <h5 class='card-title font-bold'>" . $row["dishCategory"] . "</h5>
                <a href='#' class='btn btn-outline-info'>Xem thêm</a>
              </div>
            </a>
          </div>
          ";
      }
      ?>
    </div>
  </section>

  <section class="promotions border-t border-gray-500 my-16">
    <h2 class="border-b border-gray-500 text-2xl font-bold px-2 py-4">CHƯƠNG TRÌNH DỊCH VỤ</h2>
    <div class="content-party grid grid-cols-1 gap-y-10 my-4">
      <?php
      $sql = "SELECT * FROM promotion LIMIT 3";
      $result = $conn->query($sql);
      $count = 0;

      while ($row = $result->fetch_assoc()) {
        $count++;
        if ($count % 2 == 1) {
          echo "
            <div class='card' style='backround-color: #E6F9FF; border-color: #AED6F1;'>
              <div class='flex justify-between items-center'>
                <img src='images/OkonomiVayCaNgu6Mieng.png' class='card-img-top px-4 h-64' alt=''>
                <div class='card-body w-5/12' style='border-left: 1px solid #1F618D;'>
                  <h5 class='card-title font-bold'>" . $row["promotionName"] . "</h5>
                  <p class='card-text'>" . $row["description"] . "</p>
                  <div class='text-body-secondary text-sm mt-2'>" . $row["startDate"] . " đến " . $row["endDate"] . "</div>
                  <a href='#' class='btn btn-outline-danger mt-3'>Đặt ngay</a>
                </div>
              </div>
            </div>
            ";
        } else {
          echo "
            <div class='card' style='backround-color: #E6F9FF; border-color: #AED6F1;'>
              <div class='flex justify-between items-center'>
                <div class='card-body w-5/12' style='border-right: 1px solid #1F618D;'>
                <h5 class='card-title font-bold'>" . $row["promotionName"] . "</h5>
                <p class='card-text'>" . $row["description"] . "</p>
                <div class='text-body-secondary text-sm mt-2'>" . $row["startDate"] . " đến " . $row["endDate"] . "</div>
                  <a href='#' class='btn btn-outline-danger mt-3'>Đặt ngay</a>
                </div>
                <img src='images/OkonomiVayCaNgu6Mieng.png' class='card-img-top px-4 h-64' alt=''>
              </div>
            </div>
            ";
        }
      }
      ?>
    </div>
  </section>
</main>