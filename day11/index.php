<?php
# index.php - Vulnerable XSS comment system

if (isset($_POST['comment'])) {
    file_put_contents("comments.txt", $_POST['comment'] . "\n", FILE_APPEND);
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Comment Board - Vulnerable to XSS</title>
</head>
<body>
    <h1>Leave a Comment</h1>
    <form method="POST">
        <textarea name="comment" rows="4" cols="40"></textarea><br>
        <button type="submit">Submit</button>
    </form>

    <h2>Previous Comments</h2>
    <?php
    if (file_exists("comments.txt")) {
        $comments = file("comments.txt");
        foreach ($comments as $comment) {
            echo "<p>$comment</p>"; // XSS vulnerable output
        }
    }
    ?>
</body>
</html>
