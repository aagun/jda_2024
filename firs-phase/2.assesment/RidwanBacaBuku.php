<?php 
	
  /**
  * @param $x int : total pages to read a book in a day 
  * @param $y int : total days to read a book
  * @return int
  */
  function run($x, $y) {
   $pagesReadInFirstDay = 4;
   $daysToRead = $y - 1; // total days to read minus first day
   $pagesToRead = $x * $daysToRead;
   return $pagesReadInFirstDay + pagesToRead;
  }

  // Tests

  // 1.
  echo(run(6, 4)); // expected output 22
  
   // 2.
  echo(run(4, 10)); // expected output 40
  
   // 3.
  echo(run(99, 1)); // expected output 4
  
   // 4.
  echo(run(0, 11)); // expected output 4
  
   // 5.
  echo(run(1, 2)); // expected output 5
