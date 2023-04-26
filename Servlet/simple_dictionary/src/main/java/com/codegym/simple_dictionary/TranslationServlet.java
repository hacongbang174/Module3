package com.codegym.simple_dictionary;

import java.io.*;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "TranslationServlet", value = "/translate")
public class TranslationServlet extends HttpServlet {
    private String message;

    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển vở");
        dictionary.put("computer", "Máy tính");

        String search = request.getParameter("txtSearch");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");

        String result = dictionary.get(search);
        if(result != null){
            String decoded = URLDecoder.decode(result, "UTF-8");
            writer.println("Word: " + search);
            writer.println("Result: " + decoded);
        } else {
            writer.println("Not found");
        }

        writer.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public void destroy() {
    }
}