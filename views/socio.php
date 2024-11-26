<?php

require '../vendor/autoload.php';

use App\Socio;

$migracao = new Socio();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['insert_text'])) {
    $insertText = $_POST['insert_text'];
    $migracao->processInsertToUpdate($insertText);
}

?>
<?php include 'navbar.php'; ?>
<div class="container">
    <form method="POST">
        <label for="insert_text">Insira os comandos de INSERT aqui:</label>
        <textarea name="insert_text" id="insert_text" rows="10" cols="80" placeholder="Cole os comandos de INSERT aqui..."></textarea>
        <button type="submit">Transformar em UPDATE</button>
    </form>
</div>
<?php include 'footer.php'; ?>