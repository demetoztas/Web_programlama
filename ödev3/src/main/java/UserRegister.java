import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // Formdan gelen verileri al
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Ekrana yazdır
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>KULLANICI BİLGİLERİ</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2> KULLANICI BİLGİLERİ </h2>");
        out.println("<p>Ad: " + name + "</p>");
        out.println("<p>Soyad: " + surname + "</p>");
        out.println("<p>Eposta: " + email + "</p>");
        out.println("<p>Şifre: " + maskPassword(password) + "</p>");
        out.println("</body>");
        out.println("</html>");

        // Tarayıcı modelini JavaScript mesaj kutusu olarak göster
        out.println("<script>");
        out.println("var userAgent = '" + request.getHeader("User-Agent") + "';");
        out.println("showMessage('Tarayıcı Modeli: ' + userAgent);");
        out.println("function showMessage(message) { alert(message); }");
        out.println("</script>");
    }

    // Şifreyi maskeler
    private String maskPassword(String password) {
        StringBuilder maskedPassword = new StringBuilder();
        for (int i = 0; i < password.length(); i++) {
            maskedPassword.append("*");
        }
        return maskedPassword.toString();
    }
}

       
