<?php



$pdo = new PDO('mysql:host=mysql;dbname=db', 'root', '');

$sql = <<<SQL
    SELECT * FROM user;
SQL;

var_dump($pdo);

$stmt = $pdo->prepare($sql);
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo "<pre>";
print_r($result);
echo "</pre>";

?>

