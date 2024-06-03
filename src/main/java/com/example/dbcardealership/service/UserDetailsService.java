package com.example.dbcardealership.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.example.dbcardealership.model.UserPrincipal;
import com.example.dbcardealership.repository.UserRepository;

import java.util.ArrayList;
import java.util.List;

public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserPrincipal loadUserByUsername(String email) throws UsernameNotFoundException {

        var user = userRepository.getClientByEmail(email);
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();

        System.out.println(user.getEmail() + " " + user.getFullName() + " " + user.getAuthority());
        authorities.add(new SimpleGrantedAuthority(user.getAuthority()));
        return new UserPrincipal(user.getId(), user.getEmail(), user.getPassword(), authorities);
    }
}
