package com.example.model;

public class Student {
    private String studentCode;
    private String studentName;
    private String address;
    private int age;
    private String classRoom;
    private boolean sex;

    public Student() {
    }

    public Student(String studentCode, String studentName, String address, int age, String classRoom, boolean sex) {
        this.studentCode = studentCode;
        this.studentName = studentName;
        this.address = address;
        this.age = age;
        this.classRoom = classRoom;
        this.sex = sex;
    }

    public String getStudentCode() {
        return studentCode;
    }

    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(String classRoom) {
        this.classRoom = classRoom;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }
}
