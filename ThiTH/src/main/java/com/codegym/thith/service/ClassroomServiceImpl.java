package com.codegym.thith.service;

import com.codegym.thith.model.Classroom;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClassroomServiceImpl implements IClassroomService{
    private static final String FIND_ALL_CLASSROOMS = "SELECT * FROM classroom;";
    private static final String FIND_CLASSROOM_BY_ID = "SELECT * FROM classroom where id_classroom = ?";
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
    public List<Classroom> findAllClassrooms() {
        List<Classroom> classrooms = new ArrayList<>();

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_CLASSROOMS);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idClassroom = rs.getInt("id_classroom");
                String nameClassroom = rs.getString("name_classroom");

                Classroom classroom = new Classroom(idClassroom, nameClassroom);
                classrooms.add(classroom);
            }

            System.out.println("findAllProducts: "  + preparedStatement);

            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }

        return classrooms;
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
    public Classroom findClassroomById(int idClassroom) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CLASSROOM_BY_ID);
            preparedStatement.setInt(1, idClassroom);

            System.out.println("findCategoryById: "  + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idClassroom1= rs.getInt("id_classroom");
                String nameClassroom = rs.getString("name_classroom");

                Classroom classroom = new Classroom(idClassroom1, nameClassroom);
                return classroom;
            }
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return null;
    }
}
