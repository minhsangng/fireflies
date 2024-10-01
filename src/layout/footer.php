<!-- On top button -->
<button
    class="fixed bottom-5 right-3 text-white bg-gray-700 rounded-full size-10 z-20 opacity-40 hover:opacity-100"
    onclick="scrollToTop()"
    id="onTopBtn">
    <i class="far fa-circle-up size-10"></i>
</button>

<!-- Footer -->
<footer class="pt-12 bg-slate-200 bottom-0">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-5 gap-8">
            <div class="md:col-span-2">
                <h3 class="text-lg font-bold mb-4">ABOUT FIREFLIES</h3>
                <p class="text-sm mb-4">
                    Chào mừng bạn đến với FireFlies, nơi cung cấp trải nghiệm ẩm thực
                    nhanh, tiện lợi và hương vị tươi ngon. Với thực đơn đa dạng và
                    nguyên liệu tươi ngon, chúng tôi phục vụ bạn mọi lúc, mọi nơi – từ
                    bữa ăn nhanh giữa ngày bận rộn đến những khoảnh khắc thư giãn tại
                    nhà. FireFlies – ăn nhanh, ngon miệng, và luôn sẵn sàng!
                </p>
                <a class="text-red-500" href="info.php"> Xem thêm </a>
            </div>
            <div>
                <h3 class="text-lg font-bold mb-4">QUESTIONS?</h3>
                <ul class="text-sm space-y-2">
                    <li>
                        <a href="#"> Giao hàng </a>
                    </li>
                    <li>
                        <a href="#"> Dịch vụ / FAQ's </a>
                    </li>
                </ul>
            </div>
            <div>
                <h3 class="text-lg font-bold mb-4">WHY FIREFLIES?</h3>
                <ul class="text-sm space-y-2">
                    <li>Free ship < 5km</li>
                    <li>Thương hiệu uy tín</li>
                    <li>Thanh toán nhanh chóng</li>
                    <li>Dịch vụ khách hàng tốt</li>
                </ul>
            </div>
            <div>
                <h3 class="text-lg font-bold mb-4">CONTACT FIREFLIES</h3>
                <ul class="text-sm space-y-2">
                    <li>12 Nguyen Van Bao, P4, Go Vap</li>
                    <li>+1900 123 4567</li>
                    <li>+1900 223 4456</li>
                    <li>contact@fireflies.gmail.com</li>
                </ul>
            </div>
        </div>
        <div
            class="mt-12 border-t border-gray-700 pt-8 pb-8 flex flex-col md:flex-row justify-between items-center">
            <div class="flex space-x-4 md:mb-0">
                <a class="text-black" href="#">
                    <i class="fab fa-facebook-f"> </i>
                </a>
                <a class="text-black" href="#">
                    <i class="fab fa-twitter"> </i>
                </a>
                <a class="text-black" href="#">
                    <i class="fab fa-linkedin-in"> </i>
                </a>
                <a class="text-black" href="#">
                    <i class="fab fa-pinterest-p"> </i>
                </a>
                <a class="text-black" href="#">
                    <i class="fab fa-google-plus-g"> </i>
                </a>
            </div>
            <div class="flex space-x-4 items-center">
                <p class="w-full text-center italic text-gray-500">
                    FIREFLIES &copy; 2024. PRIVACY POLICY ABOUT US BLOG CONTACTS
                </p>
            </div>
            <div class="flex items-center space-x-4">
                <input
                    class="bg-gray-800 text-white px-4 py-2 rounded"
                    placeholder="Nhập email của bạn..."
                    type="email" />
                <button class="bg-gray-700 text-white text-sm px-4 py-2 btn btn-secondary">
                    ĐĂNG KÝ
                </button>
            </div>
        </div>
    </div>
</footer>
<script>
    window.addEventListener("scroll", function() {
        if (window.scrollY > 50) {
            document.querySelector("header").classList.add("scrolled");
        } else {
            document.querySelector("header").classList.remove("scrolled");
        }
    });

    function scrollToTop() {
        const scrollStep = -window.scrollY / 15;
        const scrollInterval = setInterval(function() {
            if (window.scrollY != 0) {
                window.scrollBy(0, scrollStep);
            } else {
                clearInterval(scrollInterval);
            }
        }, 15);
    }

    window.onscrollBy = function() {
        scrollFunction();
    };
    
    function scrollFunction() {
        if (
            document.body.scrollTop > 20 ||
            document.documentElement.scrollTop > 20
        ) {
            document.getElementById("onTopBtn").style.display = "block";
        } else {
            document.getElementById("onTopBtn").style.display = "none";
        }
    }
    
    const navlinks = document.querySelectorAll(".nav-link");
    let idActive = "home";

    navlinks.forEach(function(e) {
        e.style.color = "var(--secondary-color)";
    });

    navlinks.forEach(function(item) {
        item.addEventListener("click", () => {
            navlinks.forEach((i) => i.classList.remove("active"));
        });
    });
    
    if (window.location.search != "")
        idActive = window.location.search.slice(3);

    window.addEventListener("load", () => {
        navlinks.forEach(function(item) {
            if (item.id == idActive) item.classList.add("active");
            else item.classList.remove("active");
        });
    });
</script>
</body>

</html>