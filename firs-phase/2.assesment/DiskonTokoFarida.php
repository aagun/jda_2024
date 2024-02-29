<?php

   /**
   * @param $n int: total shopping
   * @return int
   */
   function run($n) {
     $discount = 0;
     
     if ($n > 20000) {
       $discount = 0.1; // 10%
     } else if ($n > 15000) {
       $discount = 0.07; // 7%
     } else if ($n > 10000) {
       $discount = 0.05; // 5%
     } 
     
     $total = $n - ($n * $discount);
     
     return ceil($total);
   }
   
   
   // Tests
   
   // 1.
   echo(run(12000)); // expected output 11400
   
   // 2.
   echo(run(17000)); // expected output 15810
   
   // 3.
   echo(run(9000)); // expected output 9000
   
   // 4.
   echo(run(23000)); // expected output 20700
   
   // 5.
   echo(run(19999)); // expected output 18600
