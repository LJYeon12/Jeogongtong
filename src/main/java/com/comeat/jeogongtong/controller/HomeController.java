package com.comeat.jeogongtong.controller;


import com.comeat.jeogongtong.dto.HomeResponseDto;
import com.comeat.jeogongtong.dto.StudyDto;
import com.comeat.jeogongtong.dto.UserDto;
import com.comeat.jeogongtong.service.StudyMemberService;
import com.comeat.jeogongtong.service.StudyService;
import com.comeat.jeogongtong.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class HomeController {
    private final StudyService studyService;
    private final StudyMemberService studyMemberService;
    private final UserService userService;
    @GetMapping("/") //홈
    public ResponseEntity<HomeResponseDto> index(HttpSession session) {
        HomeResponseDto responseDto = new HomeResponseDto();
        Long userId = (Long) session.getAttribute("userId");
        if (userId != null) {
            UserDto loginUser = userService.findById(userId);
            if (loginUser != null) {
                List<StudyDto> myStudies = studyMemberService.findMyStudies(loginUser.getUserId());
                responseDto.setMyStudy(myStudies);
                responseDto.setUser(loginUser);
            }
        }
        return ResponseEntity.ok(responseDto);
    }
}
