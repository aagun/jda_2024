<?php

  function multiply($a, $b) {
    return $a * $b;
  }

  function sum($a, $b) {
    return $a + $b;
  }

  function subtract($a, $b) {
    return $a - $b;
  }

  function getBonus($expense) {
    if ($expense >= 2_000_000 && $expense < 5_000_000) {
      return [
        "discount" => 0.05,
      ];
    } 
    
    if ($expense >= 5_000_000 && $expense < 10_000_000) {
      return [
        "discount" => 0.1,
      ];
    } 
    
    if ($expense >= 10_000_000) {
      return [
        "discount" => 0.2,
      ];
    } 

    return [
      "discount" => 0,
    ];
  }

  function countTotalPayment($expense, $discount) {
    $totalDiscount = multiply($expense, $discount);
    return subtract($expense, $totalDiscount);
  }

  /**
   * @param integer|float $n is amount expense
   * @param integer|float $u is amount payment
   * @return integer|float
   */
  function run($n, $u) {

    if ($n > $u) {
      return 0;
    }

    $bonus = getBonus($n);
    $totalPayment = countTotalPayment($n, $bonus["discount"]);

    return (int) subtract($u, $totalPayment);

  }

  var_dump(run(7550000, 9000000));
  var_dump(run(499000, 500000));
  var_dump(run(12450500, 14750000));
  var_dump(run(2450000, 1650000));
  var_dump(run(3675500, 4510000));