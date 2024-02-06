<?php
  /**
   * @param string $k is the word(s)
   * @param string $c is the character
   * @return integer
  */
  function run($k, $c) {

    $chars = str_split($k); // convert string to array character
    $totalChar = 0;

    // loop every character
    foreach ($chars as $char) {
      // if the character is equal to character then increment the totalChar value
      if ($char == $c) {
        $totalChar++;
      }
    }

    return $totalChar;
  }

  var_dump(run("programmer", "r"));