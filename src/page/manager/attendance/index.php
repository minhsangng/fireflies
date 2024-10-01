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
        <div class="bg-white p-6 rounded-lg shadow-lg">
            <div class="flex flex-col justify-between items-center mb-4">
                <h2 class="text-xl font-semibold">Bảng chấm công tháng <?php echo date("m"); ?></h2>
                <table class="table table-bordered mt-5">
                    <thead>
                        <tr>
                            <th>Mã nhân viên</th>
                            <th>Tên nhân viên</th>
                            <th>Tổng giờ làm</th>
                            <th>Thưởng</th>
                            <th>Lương</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sql = "SELECT A.employee_id, E.employee_salary, E.employee_name, SUM(TIMESTAMPDIFF(HOUR, check_in_time, check_out_time)) AS total_hours FROM attendance AS A JOIN employees AS E ON A.employee_id = E.employee_id GROUP BY A.employee_id";
                        $result = $conn->query($sql);
                        $salary = 0;
                        $bonus = 0;
                        $percentBonus = 0;

                        if ($result->num_rows != 0) {
                            while ($row = $result->fetch_assoc()) {
                                if ($row["total_hours"] >= 9) {
                                    $percentBonus = "10%";
                                    $bonus = $row["employee_salary"] * 1.1;
                                }
                                echo "<tr>
                                    <td>".$row["employee_id"]."</td>
                                    <td>".$row["employee_name"]."</td>
                                    <td>".$row["total_hours"]."</td>
                                    <td>".$percentBonus."</td>
                                    <td>".$row["employee_salary"]."</td>
                                </tr>";
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>