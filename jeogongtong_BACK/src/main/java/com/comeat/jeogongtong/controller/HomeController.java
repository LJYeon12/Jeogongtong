package com.comeat.jeogongtong.controller;


import com.comeat.jeogongtong.dto.HomeResponseDto;
import com.comeat.jeogongtong.dto.StudyDto;
import com.comeat.jeogongtong.dto.UserDto;
import com.comeat.jeogongtong.model.Users;
import com.comeat.jeogongtong.repository.UserRepository;
import com.comeat.jeogongtong.service.StudyMemberService;
import com.comeat.jeogongtong.service.StudyService;
import com.comeat.jeogongtong.service.UserService;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class HomeController {
    private final StudyService studyService;
    private final StudyMemberService studyMemberService;
    private final FirebaseAuth firebaseAuth;
    private final UserRepository userRepository;

    @GetMapping("/") //홈
    public ResponseEntity<HomeResponseDto> index(@RequestHeader(value = "Authorization") String authHeader) throws FirebaseAuthException {
        HomeResponseDto responseDto = new HomeResponseDto();
        String idToken = authHeader.split("Bearer ")[1];
        FirebaseToken user = firebaseAuth.getInstance().verifyIdToken(idToken);
        String email = user.getEmail();
        if (email != null) {
            Users loginUser = userRepository.findByEmail(email);
            if (loginUser != null) {
                List<StudyDto> myStudies = studyMemberService.findMyStudies(loginUser.getUserId());
                responseDto.setMyStudy(myStudies);
                responseDto.setUser(loginUser);
            }
        }
        return ResponseEntity.ok(responseDto);
    }
}
