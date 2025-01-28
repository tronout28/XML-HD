<?php
require_once '../services/db-connection.php';

header('Content-Type: application/xml; charset=utf-8');

try {
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
    
    $sql = "
        SELECT 
            h.id AS history_id, 
            h.product_id,
            p.name AS product_name, 
            p.price, 
            p.image, 
            p.description, 
            p.size
        FROM 
            histories h
            INNER JOIN products p ON h.product_id = p.id
        ORDER BY h.id DESC
    ";

    $result = $conn->query($sql);

    if (!$result) {
        throw new Exception("Query failed: " . $conn->error);
    }

    echo '<?xml version="1.0" encoding="UTF-8"?>';
    echo "\n<histories>\n";

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "  <history>\n";
            foreach ($row as $key => $value) {
                echo "    <" . htmlspecialchars($key) . ">" . 
                     htmlspecialchars($value) . 
                     "</" . htmlspecialchars($key) . ">\n";
            }
            echo "  </history>\n";
        }
    } else {
        echo "  <message>No history records found.</message>\n";
    }

    echo "</histories>";

} catch (Exception $e) {
    error_log("History error: " . $e->getMessage());
    
    echo '<?xml version="1.0" encoding="UTF-8"?>';
    echo "\n<histories>\n";
    echo '  <error>' . htmlspecialchars($e->getMessage()) . '</error>\n';
    echo "</histories>";
}

$conn->close();
?>
