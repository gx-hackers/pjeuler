<?php
$maxl = 501;//最大周回数
$l = 0;//現在の週回数
$x = 1;//クロスの合計
$r = 1;//右上の数

if($maxl > 0){
    for($l = 1; $l < $maxl ; $l++){
              $b = $2 * $l;
              $r = $r + $b * 4;
                  $x = (2 * $r - $b * 3 ) * 2 + $x;
                }
}

echo $x;
?>

