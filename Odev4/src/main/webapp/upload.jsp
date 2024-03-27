<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dosya Yükleme Sonucu</title>
</head>
<body>
<%
    String uploadPath = "/uploads"; // Yüklenen dosyaların kaydedileceği klasör
    String realUploadPath = request.getServletContext().getRealPath(uploadPath); // Gerçek yükleme yolu

    File uploadDir = new File(realUploadPath);
    if (!uploadDir.exists()) {
        uploadDir.mkdir(); // Yükleme klasörünü oluştur
    }

    List<String> uploadedFiles = new ArrayList<>();
    List<String> failedFiles = new ArrayList<>();

    for (Part part : request.getParts()) {
        String fileName = extractFileName(part);
        if (fileName != null && !fileName.isEmpty()) {
            String filePath = realUploadPath + File.separator + fileName;
            try {
                part.write(filePath);
                uploadedFiles.add(fileName);
            } catch (IOException e) {
                failedFiles.add(fileName);
                e.printStackTrace();
            }
        }
    }
%>

<h2>Yükleme Sonucu</h2>
<% if (!uploadedFiles.isEmpty()) { %>
    <h3>Yüklenen Dosyalar:</h3>
    <ul>
        <% for (String fileName : uploadedFiles) { %>
            <li><%= fileName %></li>
        <% } %>
    </ul>
<% } %>

<% if (!failedFiles.isEmpty()) { %>
    <h3>Bazı Dosyalar Yüklenemedi:</h3>
    <ul>
        <% for (String fileName : failedFiles) { %>
            <li><%= fileName %></li>
        <% } %>
    </ul>
<% } %>

<%!
    // Dosya adını çıkarmak için yardımcı fonksiyon
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return null;
    }
%>

</body>
</html>
