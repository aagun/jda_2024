<?php
  /**
  * @param $str string
  * @return string
  */
  function run($str) {
    // Remove non-alphanumeric characters and convert to lowercase
    $cleanedStr = preg_replace("/[^A-Za-z0-9]/", '', strtolower($str));
    
    // Compare the original string with its reverse
    return $cleanedStr === strrev($cleanedStr) ? "benar" : "salah";
  }

  // Tests
  // 1.
  echo(run("wadidaw")); // expected output benar
  
  // 2.
  echo(run("12/02/20/21")); // expected output benar
  
  // 3.
  echo(run("jabar")); // expected output salah
  
  // 4.
  echo(run("dont't nod")); // expected output benar
  
  // 5.
  echo(run("forwards")); // expected output salah
