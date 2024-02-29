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

function countCoupon($coupon) {
  $total = 0;
  for ($i = 1; $i <= $coupon; $i++) {
    if ($i == 1) {
      $total = 100;
      continue;
    }

    $total *= 2;
  }

  return $total;
}

function getBonus($expense) {
  if ($expense >= 2_000_000 && $expense < 5_000_000) {
    return [
      "discount" => 0.05,
      "coupon" => 7
    ];
  } 
  
  if ($expense >= 5_000_000 && $expense < 10_000_000) {
    return [
      "discount" => 0.1,
      "coupon" => 10
    ];
  } 
  
  if ($expense >= 10_000_000) {
    return [
      "discount" => 0.2,
      "coupon" => 12
    ];
  } 

  return [
    "discount" => 0,
    "coupon" => 5
  ];
}

function countTotalPayment($expense, $discount, $coupon) {
  $totalCoupon = countCoupon($coupon);
  $totalDiscount = multiply($expense, $discount);
  $totalDiscount = sum($totalDiscount, $totalCoupon);
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
  $totalPayment = countTotalPayment($n, $bonus["discount"], $bonus["coupon"]);

  return subtract($u, $totalPayment);
}

var_dump(run(7550000, 9000000));
var_dump(run(499000, 500000));
var_dump(run(12450500, 14750000));
var_dump(run(2450000, 1650000));
var_dump(run(3675500, 4510000));

