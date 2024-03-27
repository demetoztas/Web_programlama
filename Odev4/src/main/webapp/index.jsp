<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>File Upload Interface</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f4f4f4;
    }
    .container {
        text-align: center;
        width: 400px;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h2 {
        margin-bottom: 20px;
    }
    input[type="file"] {
        display: none;
    }
    label {
        display: block;
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
    }
    #uploadBtn {
        margin-top: 20px;
        background-color: #28a745;
    }
    #progress {
        margin-top: 20px;
        width: 100%;
        background-color: #ddd;
        border-radius: 4px;
    }
    #bar {
        width: 0%;
        height: 30px;
        background-color: #4CAF50;
        text-align: center;
        line-height: 30px;
        color: white;
        border-radius: 4px;
    }
</style>
</head>
<body>
<div class="container">
    <h2>File Upload Interface</h2>
    <form id="uploadForm" enctype="multipart/form-data">
        <label for="fileInput">Choose File</label>
        <input type="file" id="fileInput" name="files[]" multiple>
        <button type="button" id="uploadBtn">Upload</button>
    </form>
    <div id="progress">
        <div id="bar"></div>
    </div>
    <div id="status"></div>
</div>
<script>
    document.getElementById('uploadBtn').addEventListener('click', uploadFiles);

    function uploadFiles() {
        var files = document.getElementById('fileInput').files;
        if (files.length === 0) {
            alert('Please select a file.');
            return;
        }

        var formData = new FormData();
        for (var i = 0; i < files.length; i++) {
            formData.append('files[]', files[i]);
        }

        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'upload.jsp', true);

        xhr.upload.onprogress = function(e) {
            if (e.lengthComputable) {
                var percentComplete = (e.loaded / e.total) * 100;
                document.getElementById('bar').style.width = percentComplete + '%';
                document.getElementById('bar').innerHTML = percentComplete.toFixed(2) + '%';
            }
        };

        xhr.onload = function() {
            document.getElementById('status').innerHTML = 'Upload complete.';
            document.getElementById('bar').style.width = '100%';
            document.getElementById('bar').innerHTML = '100%';
        };

        xhr.onerror = function() {
            alert('An error occurred while uploading.');
        };

        xhr.send(formData);
    }
</script>
</body>
</html>

