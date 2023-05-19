package com.codegym.thith.controller;

import com.codegym.thith.model.Classroom;
import com.codegym.thith.model.Student;
import com.codegym.thith.service.ClassroomServiceImpl;
import com.codegym.thith.service.IClassroomService;
import com.codegym.thith.service.IStudentService;
import com.codegym.thith.service.StudentServiceImpl;
import com.codegym.thith.utils.LocalDateFormat;
import com.codegym.thith.utils.ValidateUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "StudentServlet", urlPatterns = "/students")
public class StudentServlet extends HttpServlet {

    private StudentServiceImpl studentService;
    private ClassroomServiceImpl classroomService;
    @Override
    public void init() {
        studentService = new StudentServiceImpl();
        classroomService = new ClassroomServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddStudent(req, resp);
                break;
            case "edit":
                showEditStudent(req, resp);
                break;
            default:
                showStudents(req, resp);
        }
    }

    private void showEditStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        int idStudent = 0;
        try {
            idStudent = Integer.parseInt(req.getParameter("id"));
        } catch (NumberFormatException e) {
            errors.add("id không hợp lệ");
        }

        Student student = studentService.findAllStudentById(idStudent);
        List<Classroom> classrooms = classroomService.findAllClassrooms();

        req.setAttribute("classrooms", classrooms);
        req.setAttribute("student", student);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/edit.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showAddStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Classroom> classrooms = classroomService.findAllClassrooms();

        req.setAttribute("classrooms", classrooms);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/create.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showStudents(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> students = studentService.findAllStudents();
        List<Classroom> classrooms = classroomService.findAllClassrooms();

        req.setAttribute("students", students);
        req.setAttribute("classrooms", classrooms);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                createStudent(req, resp);
                break;
            case "edit":
                editStudent(req,resp);
                break;
            case "delete":
                deleteStudent(req, resp);
                break;
            case "search":
                searchStudent(req,resp);
                break;
        }
    }

    private void searchStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text = req.getParameter("text");
        List<Student> students = studentService.SearchAll(text);
        List<Classroom> classrooms = classroomService.findAllClassrooms();

        req.setAttribute("students", students);
        req.setAttribute("classrooms", classrooms);
        req.getRequestDispatcher("/list.jsp").forward(req, resp);
    }

    private void editStudent(HttpServletRequest req, HttpServletResponse resp) {
        List<String> errors = new ArrayList<>();
        Student student = new Student();
        int idStudent = 0;
        try {
            try {
                idStudent = Integer.parseInt(req.getParameter("id"));
            } catch (NumberFormatException e) {
                errors.add("id không hợp lệ");
            }
            validateName(req, errors, student);
            validateLocalDate(req, errors, student);
            validateAddress(req,errors,student);
            validatePhone(req,errors,student);
            validateEmail(req,errors,student);
            validateClassroom(req, errors, student);


            if (errors.isEmpty()) {
                studentService.updateStudent(idStudent,student);
                req.setAttribute("message", "Add student success");
                resp.sendRedirect("/students");
            }else{
                req.setAttribute("errors", errors);
                req.setAttribute("student", student);
                List<Classroom> classrooms = classroomService.findAllClassrooms();
                req.setAttribute("classrooms", classrooms);
                req.getRequestDispatcher("/edit.jsp").forward(req,resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int idStudent = Integer.parseInt(req.getParameter("id"));
        studentService.deleteStudent(idStudent);
        resp.sendRedirect("/students");
    }

    private void createStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        Student student = new Student();
        validateName(req, errors, student);
        validateLocalDate(req, errors, student);
        validateAddress(req,errors,student);
        validatePhone(req,errors,student);
        validateEmail(req,errors,student);
        validateClassroom(req, errors, student);


        if (errors.isEmpty()) {
            studentService.addStudent(student);
            req.setAttribute("message", "Add student success");
        }else{
            req.setAttribute("errors", errors);
            req.setAttribute("student", student);
            List<Classroom> classrooms = classroomService.findAllClassrooms();
            req.setAttribute("classrooms", classrooms);
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/create.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void validateClassroom(HttpServletRequest req, List<String> errors, Student student) {
        try {
            int idClassroom = Integer.parseInt(req.getParameter("classroom"));
            Classroom c = classroomService.findClassroomById(idClassroom);
            if (c == null) {
                errors.add("Danh mục class không hợp lệ");
            }else{
                student.setIdClassroom(idClassroom);
            }

        } catch (NumberFormatException numberFormatException) {
            errors.add("Danh mục class không hợp lệ");
        }
    }
    private void validateLocalDate(HttpServletRequest req, List<String> errors, Student student) {
        try {
            LocalDate dob = LocalDateFormat.parseLocalDate(req.getParameter("dob"));
            student.setDob(dob);

        } catch (IllegalArgumentException illegalArgumentException) {
            errors.add("Ngày không hợp lệ");
        }
    }
    private void validatePhone(HttpServletRequest req, List<String> errors, Student student) {
        String phone = req.getParameter("phone");
        if (!ValidateUtils.isPhoneNumber(phone)) {
            errors.add("Số điện thoại không hợp lệ. Phải bắt đầu là 84 hoặc 0 số và có tổng 10 kí tự!");
        }
        student.setPhone(phone);
    }
    private void validateEmail(HttpServletRequest req, List<String> errors, Student student) {
        String email = req.getParameter("email");
        if (!ValidateUtils.isEmailValid(email)) {
            errors.add("Email không hợp lệ!");
        }
        student.setEmail(email);
    }
    private void validateAddress(HttpServletRequest req, List<String> errors, Student student) {
        String address = req.getParameter("address");
        if (!ValidateUtils.isAddress(address)) {
            errors.add("Địa chỉ không hợp lệ. Phải bắt đầu là chữ số và có từ 3-255 kí tự!");
        }
        student.setAddress(address);
    }
    private void validateName(HttpServletRequest req, List<String> errors, Student student) {
        String name = req.getParameter("name");
        if (!ValidateUtils.isNameValid(name)) {
            errors.add("Tên không hợp lệ. Phải bắt đầu là chữ và có từ 2-200 kí tự!");
        }
        student.setName(name);
    }
}
