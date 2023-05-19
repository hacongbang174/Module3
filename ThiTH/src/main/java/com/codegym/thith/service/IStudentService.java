package com.codegym.thith.service;

import com.codegym.thith.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAllStudents();
    void addStudent(Student student);
    void updateStudent(int idStudent, Student student);

    void deleteStudent(int idStudent);

    List<Student> SearchAll(String text);
}
