<?php
    include('connection.php');

    if(isset($_POST['search'])){
        
        $category = $_POST['category'];
        $price = $_POST['price'];

        $stmt = $conn->prepare("SELECT * FROM products WHERE product_category=? AND product_price<=?");

        $stmt->bind_param("si",$category,$price);
    
        $stmt->execute();
        
        $products = $stmt->get_result();



    }
    else{
      
      if(isset($_GET['page_no']) && $_GET['page_no'] != ""){
        $page_no = $_GET['page_no'];
      }
      else{
        $page_no = 1; 
      }

      $stmt1 = $conn->prepare("SELECT COUNT(*) AS total_records FROM products");
      $stmt1->execute();
      $stmt1->bind_result($total_records);
      $stmt1->store_result();
      $stmt1->fetch();

      $total_records_per_page = 6;
      $offset = ($page_no-1) * $total_records_per_page;
      $previous_page = $page_no-1;
      $next_page = $page_no+1;
      $adjacents = "2";

      $total_no_of_pages = ceil($total_records/$total_records_per_page);

      $stmt2 = $conn->prepare("SELECT * FROM products LIMIT $offset,$total_records_per_page");
      $stmt2->execute();
      $products = $stmt2->get_result();
    }
?>




<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shop</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

  <link rel="stylesheet" href="assets/css/style.css" />
  <style>
    .pagination a {
      color: coral
    }

    .pagination li:hover a{
      color: white;
      background-color: red;
    }
  </style>

</head>

<body>

<?php include("layouts/header.php")?>

 



  <!--Featured-->
  <section id="featured" class="my-5 py-5 ">
    <div class="container  mt-5 py-5">
      <h3>Our Products</h3>
      <hr>
    </div>
    <div class="row mx-auto container">
        <?php while($row = $products->fetch_assoc()) { ?>
      <div onclick="window.location.href='<?php echo "single_product.php?product_id=".$row['product_id']; ?>'"  class="product text-center col-md-4 col-sm-12">
        <img class="img-fluid mb-3" src="assets/imgs/<?php echo $row['product_image']; ?>" />
        <div class="star">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
        </div>
        <h5 class="p-name"> <?php echo $row['product_name']; ?></h5>
        <h4 class="p-price"><?php echo $row['product_price']; ?></h4>
       <a class="btn buy-btn" href="<?php echo "single_product.php?product_id=".$row['product_id']; ?>">Buy Now</a>
      </div>

      <?php } ?>
      <nav aria-label="Page navigation example">
        <ul class="pagination mt-5">

          <li class="page-item <?php if($page_no<=1){echo 'disabled';} ?>">
          <a class="page-link" href="<?php if($page_no<=1){echo '#';} else{
           echo "?page_no=".$page_no-1; }  ?>">Previous</a></li>
         
         <li class="page-item"><a class="page-link" href="?page_no=1">1</a></li>

          <li class="page-item"><a class="page-link" href="?page_no=2">2</a></li>
          
          
          <li class="page-item <?php if($page_no>=$total_no_of_pages){echo 'disabled';} ?>">
          <a class="page-link" href="<?php if($page_no>=$total_no_of_pages){echo '#';}
            else{
              echo "?page_no=".$page_no+1; }?>">Next</a></li>
        </ul>
      </nav>
    </div>
  </section>

  




  <?php include('layouts/footer.php');?>