<?php

  /**
  * @param $x int : amount every month 
  * @param $y int : increased amount every month 
  * @param $z int : total months
  * @return int
  */
  function run($x, $y, $z) {
    $months = $z * ($z - 1) / 2;
    $totalIncreasingAmount = $y * $months;
    $totalBrutoAmount = $x * $z;
    return totalBrutoAmount + $totalIncreasingAmount;
  }
  
  // Tests
  // 1.
  echo(run(75000, 3000, 12));


