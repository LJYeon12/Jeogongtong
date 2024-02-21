package com.comeat.jeogongtong.controller;

import com.comeat.jeogongtong.dto.UserDto;
import com.comeat.jeogongtong.service.UserService;
import com.comeat.jeogongtong.dto.StudyMemberDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "/users")
public class UserController {
    private final UserService userService;

    /* 마이페이지 조회*/
    @GetMapping("/{userId}")
    public ResponseEntity<Map<String, Object>> findById (@PathVariable Long userId){
        UserDto userDto = userService.findById(userId);
        //스터디 랭킹 추가
        List<StudyMemberDto> studyRank = userService.findStudyRankByUserId(userId);

        Map<String, Object> response = new HashMap<>();
        response.put("user", userDto);
        response.put("studyRank", studyRank);

        return ResponseEntity.ok(response);
    }
}
