<?php
  
    if(isset($_GET['order_status'])){
        $order_status = $_GET['order_status'];
    }
    if(isset($_POST['order_pay_btn'])){
        $order_total_price =$_POST['order_total_price'];       
    }

?>


<?php include('layouts/header.php');?>

    <!--Paymentt-->
    <section class="my-5 py-5">
        <div class="container text-center mt-3 pt-5">
            <h2 class="form-weight-bold">Payment</h2>
            <hr class="mx-auto">
        </div>
        <div class="mx-auto container text-center">
        <?php if($order_status && $order_status == "Order placed successfully!") echo '<h1>'.$order_status.'</h1>' ?>
        <input class="btn btn-primary" onclick="window.location='index.php'" type="submit" value="Cash on delivery"/>
       
        </div>
    </section>

    <?php include('layouts/footer.php');?>