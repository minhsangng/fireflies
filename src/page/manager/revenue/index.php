<div class="flex-1 p-6 pb-2 md:p-10">
    <div class="flex justify-between items-center mb-6 hover:cursor-pointer">
        <div class="relative w-1/2 flex">
            <input class="w-full py-2 px-4 mr-2 rounded-lg border border-gray-300" placeholder="Tìm kiếm..." type="text" />
            <button type="submit" class="btn btn-primary ml-2 px-3">Tìm</button>
        </div>
        <div class="flex items-center hover:cursor-pointer">
            <div class="ml-4 bg-blue-100 text-blue-500 p-2 rounded-full text-xl hover:bg-blue-500 hover:text-white">
                <i class="fa-regular fa-envelope"></i>
            </div>
            <div class="ml-4 bg-blue-100 text-blue-500 p-2 rounded-full text-xl hover:bg-blue-500 hover:text-white">
                <i class="fa-regular fa-bell"></i>
            </div>
            <div class="ml-4 flex items-center relative user-container">
                <img alt="User Avatar" class="rounded-full mr-1 border-solid border-2" height="40" width="40" src="../../../images/user.png" />
                <span class="text-xs font-bold ml-1">Sang</span>

                <div class="subnav absolute top-11 right-0 bg-white rounded-lg bg-gray-500 h-fit p-2 text-center border-2">
                    <a href="../../../index.php">Đăng xuất <i class="fa-solid fa-right-from-bracket"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div class="grid grid-cols-1 md:grid-cols-1 gap-6 mt-8">
        <div class="bg-white p-6 rounded-lg shadow-lg mb-6">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-semibold">
                    Thống kê doanhh thu từ bán hàng
                </h2>
                <div class="flex items-center">
                    <button class="btn bg-green-100 text-green-500 py-2 px-4 rounded-lg mr-1 hover:bg-green-500 hover:text-white">Xuất <i class="fa-solid fa-table"></i></button>
                    <button class="btn bg-blue-100 text-blue-500 py-2 px-4 rounded-lg ml-1 hover:bg-blue-500 hover:text-white">In <i class="fa-solid fa-print"></i></button>
                </div>
            </div>
            <div class="h-fit bg-gray-100 rounded-lg p-6">
                <table class="text-base w-full">
                    <thead>
                        <tr>
                            <th class="text-left text-gray-600">Ngày</th>
                            <th class="text-left text-gray-600">Hình thức</th>
                            <th class="text-left text-gray-600">Doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sql = "SELECT * FROM orders";
                        $result = $conn->query($sql);
                        $revenue = 0;

                        while ($row = $result->fetch_assoc()) {
                                echo "
                                    <tr>
                                        <td class='py-2'>" . $row["order_date"] . "</td>
                                        <td class='py-2'>" . $row["payment_method"] . "</td>
                                        <td class='py-2'>" . $row["order_total_amount"] . "</td>
                                    </tr>
                                    ";
                                $revenue+=$row["order_total_amount"];
                        }
                        ?>
                    </tbody>
                    <tfoot>
                        <tr class="border-t-2">
                            <td colspan="2" class="font-bold text-lg">Tổng doanh thu:</td>
                            <td><?php echo $revenue; ?> đồng</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>