<?php
   function multiply($a, $b) {
      return $a * $b;
   }

   /**
      * @param integer $x is the index of price
      * @param integer $y is qty of month
      * @return integer
   */
   function run($x, $y) {
      $prices = [
         149000,
         219000,
         99000
      ];

      return multiply($prices[$x], $y);
   }

   var_dump(run(1, 10));
