document.addEventListener("DOMContentLoaded", function () {

  const dropdownBtn = document.getElementById("dropdown 2");
  const dropdown = new bootstrap.Dropdown(dropdownBtn);

  dropdownBtn.addEventListener("mouseenter", function () {
    dropdown.show();
    dropdownBtn.setAttribute("aria-expanded", "true");
  });

  dropdownBtn.addEventListener("mouseleave", function () {
    dropdown.hide();
    dropdownBtn.setAttribute("aria-expanded", "false");
  });
  
  dropdownBtn.addEventListener("click", function() {
    window.location.href = "index.php?p=menuitems";
  });
});
