package com.codegym.thith.service;

import com.codegym.thith.model.Classroom;
import com.codegym.thith.model.Student;
import com.codegym.thith.utils.LocalDateFormat;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class StudentServiceImpl implements IStudentService{
    private static final String FIND_ALL_STUDENTS = "SELECT * FROM student;";
    private static final String FIND_ALL_STUDENT_ID= "SELECT * FROM student WHERE id = ?;";
    private static final String ADD_STUDENT = "INSERT student (`name`, dob, address, phone, email, id_classroom) VALUES (?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_STUDENT = "UPDATE `student` SET `name` = ?, `dob` = ?, `address` = ?, `phone` = ?, `email` = ?, `id_classroom` = ?  WHERE (`id` = ?);";
    private static final String DELETE_STUDENT = "DELETE FROM `student` WHERE (`id` = ?);";
    private static final String SEARCH_STUDENT = "SELECT distinct s.id, s.name, s.dob, s.address, s.phone, s.email, classroom.id_classroom" +
            "            FROM student s join classroom on classroom.id_classroom = s.id_classroom" +
            "            WHERE s.name LIKE ? OR s.address LIKE ? OR s.phone LIKE ? OR s.email LIKE ? OR classroom.name_classroom LIKE ?;";
    private String jdbcURL = "jdbc:mysql://localhost:3306/th_student_manager?allowPublicKeyRetrieval=true&useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Anhvanmo.123";
    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public List<Student> findAllStudents() {
        List<Student> students = new ArrayList<>();

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_STUDENTS);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idStudent = rs.getInt("id");
                LocalDate dobStudent = rs.getDate("dob").toLocalDate();
                String nameStudent = rs.getString("name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                int idClassroom = rs.getInt("id_classroom");

                Student student = new Student(idStudent, nameStudent, dobStudent, address, phone, email, idClassroom );
                students.add(student);
            }

            System.out.println("findAllStudents: "  + preparedStatement);

            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }

        return students;
    }

    public Student findAllStudentById(int id) {
        Student student = new Student();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_STUDENT_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idStudent = rs.getInt("id");
                LocalDate dobStudent = rs.getDate("dob").toLocalDate();
                String nameStudent = rs.getString("name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                int idClassroom = rs.getInt("id_classroom");

                student = new Student(idStudent, nameStudent, dobStudent, address, phone, email, idClassroom );
            }

            System.out.println("findAllStudents: "  + preparedStatement);

            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }

        return student;
    }
    private void printSQLException(SQLException sqlException) {
        for (Throwable e : sqlException) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = sqlException.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public void addStudent(Student student) {
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(ADD_STUDENT);
            preparedStatement.setString(1, student.getName());
            preparedStatement.setDate(2, LocalDateFormat.parseLocalDateToDate(student.getDob()));
            preparedStatement.setString(3, student.getAddress());
            preparedStatement.setString(4,  student.getPhone());
            preparedStatement.setString(5, student.getEmail());
            preparedStatement.setInt(6, student.getIdClassroom());
            System.out.println("addStudent: " + preparedStatement);

            preparedStatement.executeUpdate();

            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public void updateStudent(int idStudent, Student student) {
        try {
            Connection connection = getConnection();
            //UPDATE `student` SET `name` = ?, `dob` = ?, `address` = ?, `phone` = ?, `email` = ?, `id_classroom` = ?  WHERE (`id` = ?);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STUDENT);
            preparedStatement.setString(1, student.getName());
            preparedStatement.setDate(2, LocalDateFormat.parseLocalDateToDate(student.getDob()));
            preparedStatement.setString(3, student.getAddress());
            preparedStatement.setString(4,  student.getPhone());
            preparedStatement.setString(5, student.getEmail());
            preparedStatement.setInt(6, student.getIdClassroom());
            preparedStatement.setInt(7, idStudent);
            preparedStatement.executeUpdate();
            System.out.println("updateStudent: " + preparedStatement);
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public void deleteStudent(int idStudent) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_STUDENT);
            preparedStatement.setInt(1, idStudent);

            preparedStatement.executeUpdate();

            System.out.println("deleteStudent: " + preparedStatement);

        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
    }

    @Override
    public List<Student> SearchAll(String text) {
        List<Student> list = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_STUDENT);
            preparedStatement.setString(1, "%" + text + "%");
            preparedStatement.setString(2, "%" + text + "%");
            preparedStatement.setString(3, "%" + text + "%");
            preparedStatement.setString(4, "%" + text + "%");
            preparedStatement.setString(5, "%" + text + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                list.add(new Student(rs.getInt(1), rs.getString(2), rs.getDate(3).toLocalDate(), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
