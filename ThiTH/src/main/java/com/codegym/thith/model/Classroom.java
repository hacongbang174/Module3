package com.codegym.thith.model;

public class Classroom {
    private int idClassroom;
    private String nameClassroom;

    public Classroom(int idClassroom, String nameClassroom) {
        this.idClassroom = idClassroom;
        this.nameClassroom = nameClassroom;
    }
    public Classroom(String nameClassroom) {
        this.nameClassroom = nameClassroom;
    }
    public int getIdClassroom() {
        return idClassroom;
    }

    public void setIdClassroom(int idClassroom) {
        this.idClassroom = idClassroom;
    }

    public String getNameClassroom() {
        return nameClassroom;
    }

    public void setNameClassroom(String nameClassroom) {
        this.nameClassroom = nameClassroom;
    }
}
