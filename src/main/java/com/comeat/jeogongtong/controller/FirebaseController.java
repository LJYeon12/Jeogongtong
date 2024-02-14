package com.comeat.jeogongtong.controller;
import com.comeat.jeogongtong.dto.UserResponseDto;
import com.comeat.jeogongtong.model.Users;
import com.comeat.jeogongtong.repository.UserRepository;
import com.comeat.jeogongtong.service.FirebaseAuthService;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;


import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequiredArgsConstructor
public class FirebaseController {

    private final FirebaseAuthService firebaseService;

    @PostMapping("/login")
    public ResponseEntity<String> loginWithFirebase(@RequestBody Map<String, String> payload) {
        UserResponseDto user = firebaseService.AuthService(payload);
        return ResponseEntity.ok("Successfully authenticated user with email: " + user.getEmail() + user.getNickname());
    }
}
