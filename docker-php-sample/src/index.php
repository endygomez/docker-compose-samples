<?php
echo "Hi, Browser Travel Solutions!<br>";

// Get the API URL from the environment variable
$apiUrl = getenv('API_URL');
$redisPath =  "$apiUrl/redis";

// Function to make a POST request to the .NET API to create a new key
function createNewKey($key, $value, $redisPath) {
    $apiUrl = $redisPath; // Use the provided redisPath
    $data = json_encode(['Key' => $key, 'Value' => $value]);

    $ch = curl_init($apiUrl);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json',
        'Content-Length: ' . strlen($data)
    ]);

    $response = curl_exec($ch);
    curl_close($ch);

    if ($response === false) {
        return 'Error making request';
    }

    return 'Key created successfully';
}

// Function to make a GET request to the .NET API to get a key's value
function getKeyValue($key, $redisPath) {
    $apiUrl = "$redisPath/$key"; // Use the provided redisPath
    $ch = curl_init($apiUrl);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close($ch);

    if ($response === false) {
        return 'Error making request';
    }

    return $response;
}

// Handle POST requests to create a new key
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['action']) && $_POST['action'] == 'create') {
    $key = $_POST['key'] ?? '';
    $value = $_POST['value'] ?? '';
    $result = createNewKey($key, $value, $redisPath);
    echo "$result<br>";
}

// Handle GET requests to fetch a key's value
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['key'])) {
    $key = $_GET['key'];
    $value = getKeyValue($key, $redisPath);
    echo "Key: " . htmlspecialchars($key) . ", Valor: " . htmlspecialchars($value) . "<br>";
}
?>

<form method="post">
    <input type="text" name="key" placeholder="Key" required>
    <input type="text" name="value" placeholder="Value" required>
    <input type="hidden" name="action" value="create">
    <button type="submit">Create new key</button>
</form>

<form method="get">
    <input type="text" name="key" placeholder="Key" required>
    <button type="submit">Get value of key</button>
</form>
