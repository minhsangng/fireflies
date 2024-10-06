<div class="bg-white p-6 rounded-lg shadow-lg mb-6">
    <div class="flex justify-center items-center mb-4">
        <h2 class="text-xl font-semibold">
            Tạo đơn hàng
        </h2>
    </div>
    <div class="h-fit bg-gray-100 rounded-lg">
        <div class="grid grid-cols-3 pr-4 py-3">
            <div class="col-span-2">
                <div class="grid grid-cols-5 mb-4">
                    <?php
                    $sql = "SELECT * FROM dish";
                    $result = $conn->query($sql);
                    $n = 0;
                    $total = $result->num_rows;

                    while ($row = $result->fetch_assoc()) {
                        $n++;
                        echo "<div class='relative flex justify-center'>
                                <a href='?p=" . $row["dishID"] . "'>
                                    <img src='../../../images/dish/" . $row["image"] . "' class='size-28 rounded-md'/>
                                    <p class='absolute top-0 left-0 right-0 rounded-sm font-bold text-sm text-center text-red-500 py-1 px-2'>" . $row["dishName"] . "</p>
                                </a>
                            </div>";

                        if ($n % 5 == 0 && $n < $total) {
                            echo "</div><div class='grid grid-cols-5 mb-4'>";
                        } else if ($n == $total) {
                            echo "</div>";
                        }
                    }

                    if (isset($_GET["p"])) {
                        $_SESSION["products"][] = $_GET["p"];
                    }
                    ?>
                </div>

                <div class="col-span-1">
                    <div class="grid grid-cols-1 p-2 border-2 rounded-lg h-full">
                        <form action="" method="POST" class="px-0">
                            <table class="w-full">
                                <thead class="border-b text-lg">
                                    <th><p class="my-2">Sản phẩm</p></th>
                                    <th colspan="2"><p class="my-2">Số lượng</p></th>
                                </thead>
                                <tbody class="">
                                    <?php
                                    if (isset($_POST["btnxoa"])) {
                                        $productIdToRemove = $_POST["btnxoa"];

                                        if (($key = array_search($productIdToRemove, $_SESSION["products"])) !== false) {
                                            unset($_SESSION["products"][$key]);
                                        }
                                    }

                                    $sql = "SELECT * FROM dish";
                                    $result = $conn->query($sql);

                                    if (isset($_SESSION["products"]) && !empty($_SESSION["products"])) {
                                        while ($row = $result->fetch_assoc()) {
                                            if (in_array($row["dishID"], $_SESSION["products"])) {
                                                echo "<tr class='h-10'>
                                                        <td class='w-full'><p>" . $row["dishName"] . "</p></td>
                                                        <td class='w-20'>
                                                            <input type='number' min='1' value='1' class='w-20 text-center rounded-md form-control py-0.5 text-lg font-bold'>
                                                        </td>
                                                        <td>
                                                            <button type='submit' name='btnxoa' class='btn btn-secondary py-1 m-1' value='" . $row["dishID"] . "'>Xóa</button>
                                                        </td>
                                                    </tr>";
                                            }
                                        }
                                    } else {
                                        echo "<tr class='h-10'>
                                            <td colspan='3'>Danh sách trống.</td>
                                        </tr>";
                                    }
                                    ?>

                                </tbody>
                                <tfoot class="border-t">
                                    <tr>
                                        <td colspan="3" class="text-right">
                                            <button type="reset" class="btn btn-secondary mt-2">Hủy</button>
                                            <button type="submit" class="btn btn-danger mt-2">Thanh toán</button>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>