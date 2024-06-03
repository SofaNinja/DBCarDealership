package com.example.dbcardealership.model;

public interface FullUserDTO extends UserDTO {
    String getPassword();
    String getAuthority();
}
