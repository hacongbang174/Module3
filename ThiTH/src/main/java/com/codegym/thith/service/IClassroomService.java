package com.codegym.thith.service;

import com.codegym.thith.model.Classroom;

import java.util.List;

public interface IClassroomService {
    List<Classroom> findAllClassrooms();

    Classroom findClassroomById(int idClassroom);
}
