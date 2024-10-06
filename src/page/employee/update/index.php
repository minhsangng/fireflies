<div class="grid grid-cols-1 md:grid-cols-1 gap-6 mt-8">
    <div class="bg-white p-6 rounded-lg shadow-lg">
        <h2 class="text-lg font-semibold mb-4 text-center">
            Danh sách đơn hàng
        </h2>

        <?php
        $id = $_POST["btnsua"];
        $status = $_POST["status"];
        if (isset($_POST["btnsua"])) {
            $sql = "UPDATE orders SET status = '$status' WHERE orderID = $id";
            $result = $conn->query($sql);
        }
        
        $sql = "SELECT * FROM orders AS O JOIN customers AS C ON O.customerID = C.customerID JOIN order_dish AS OD ON OD.orderID = O.orderID JOIN dish AS D ON D.dishID = OD.dishID ORDER BY O.orderID ASC";
        $result = $conn->query($sql);

        if ($result->num_rows != 0) {
            echo "
            <table class='w-full text-sm'>
                <thead>
                    <tr>
                        <th class='text-left text-gray-600'>
                            Mã đơn
                        </th>
                        <th class='text-left text-gray-600'>
                            Ngày &amp; giờ
                        </th>
                        <th class='text-left text-gray-600'>
                            Tổng giá trị
                        </th>
                        <th class='text-left text-gray-600'>
                            Trạng thái
                        </th>
                    </tr>
                </thead>
            <tbody>
            ";
            while ($row = $result->fetch_assoc()) {
                $amount = number_format($row["totalAmount"], 2, '.', ',');
                $orderID = $row["orderID"];
                $cusName = $row["customerName"];
                $orderName = $row["dishName"];
                $orderQuantity = $row["quantity"];
                $orderDate = $row["orderDate"];
                $status = $row["status"];

                echo "
                <tr data-id='$orderID' data-cus='$cusName' data-name='$orderName' data-quan='$orderQuantity' data-date='$orderDate' data-amount='$amount' data-status='$status' class='cursor-pointer'>
                    <td class='py-2'>
                        #101" . $row["orderID"] . "
                    </td>
                    <td class='py-2'>
                        " . $row["orderDate"] . "
                    </td>
                    <td class='py-2'>
                        " . $amount . "
                    </td>
                    <td class='py-2'>
                    <span class='bg-" . ($row["status"] == 'Hoàn thành' ? 'green' : 'blue') . "-100 text-" . ($row["status"] == 'Hoàn thành' ? 'green' : 'blue') . "-500 py-1 px-2 rounded-lg'>
                            " . $row["status"] . "
                        </span>
                    </td>
                </tr>
            ";
            }
            echo "</tbody>
            </table>";
        } else {
            echo "<p class='text-center py-2 font-semibold'>Chưa có dữ liệu!</p>";
        }
        ?>
    </div>

    <div class="modal modalOrder fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="" method="POST">
                    <div class="modal-header">
                        <h2 class="modal-title fs-5 font-bold text-3xl" id="orderModalLabel" style="color: #E67E22;"></h2>
                    </div>
                    <div class="modal-body"></div>
                    <div class="modal-footer"></div>
                </form>

            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const rows = document.querySelectorAll("tr.cursor-pointer");

            rows.forEach(function(row) {
                row.addEventListener("click", function() {
                    const orderID = this.getAttribute("data-id");
                    const cusName = this.getAttribute("data-cus");
                    const orderName = this.getAttribute("data-name");
                    const orderQuantity = this.getAttribute("data-quan");
                    const orderDate = this.getAttribute("data-date");
                    const amount = this.getAttribute("data-amount");
                    const status = this.getAttribute("data-status");
                    let modalBody = document.querySelector("#orderModal .modal-body");
                    let modalFooter = document.querySelector("#orderModal .modal-footer");
                    const arrStatus = ["Hoàn thành", "Sẵn sàng giao", "Đang chế biến", "Đã chế biến xong"];
                    const arrNew = [];

                    const index = arrStatus.indexOf(status);
                    let j = 0;
                    if (index != -1)
                        for (let i = 0; i < arrStatus.length; i++) {
                            if (i != index) {
                                arrNew[j] = arrStatus[i];
                                j++;
                            }
                        }

                    document.getElementById("orderModalLabel").textContent = "Chi tiết đơn hàng #101" + orderID;
                    modalBody.innerHTML = `<form action="" class="form-container w-full">
                        <table>
                            <tr><td>Họ tên: ${cusName}</td></tr>
                            <tr><td>Ngày &amp; giờ đặt: ${orderDate}</td></tr>
                            <tr>
                                <td>
                                    Món: ${orderName} - Số lượng: ${orderQuantity}
                                </td>
                            </tr>
                            <tr><td>Tổng giá trị đơn: ${amount} VND</td></tr>
                            <tr>
                                <td>
                                    <select name="status" id="status" class="w-full form-control" required>
                                        <option value="${status}">${status}</option>
                                        <option value="${arrNew[0]}">${arrNew[0]}</option>
                                        <option value="${arrNew[1]}">${arrNew[1]}</option>
                                        <option value="${arrNew[2]}">${arrNew[2]}</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </form>`;

                    modalFooter.innerHTML = `
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary" name="btnsua" value="${orderID}">Xác nhận</button>`;

                    const orderModal = new bootstrap.Modal(document.getElementById("orderModal"));
                    orderModal.show();
                });
            });
        });
    </script>