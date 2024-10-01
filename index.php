<?php
error_reporting(1);
$conn = new mysqli("localhost", "root", "", "fireflies");

include_once("src/layout/header.php");

$p = "";

if ($_REQUEST["p"] != "")
  $p = $_REQUEST["p"];
else
  $p = "home";
  
if ($p != "home") {
  require("src/page/" . $p . "/index.php");
} else
  require("src/page/home/index.php");

echo "<script src='src/main.js'></script>";

include_once("src/layout/footer.php");
