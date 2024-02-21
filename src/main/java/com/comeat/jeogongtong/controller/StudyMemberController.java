package com.comeat.jeogongtong.controller;

import com.comeat.jeogongtong.service.StudyMemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "/study-member")
public class StudyMemberController {
    private final StudyMemberService studyMemberService;
    /*
    * 스터디 신청*/
    @PostMapping("/apply")
    public ResponseEntity<?> apply(@RequestParam Long studyId, HttpSession session){
        // 세션에서 userId 가져오기
        Long userId = (Long) session.getAttribute("userId");
        // 파이어베이스에 맞춰서 변경 필요할 수도
        if (userId != null) {
            studyMemberService.addStudyMember(userId, studyId);
            System.out.println("스터디 등록이 완료되었습니다!");
            return ResponseEntity.ok().body("스터디 등록이 완료되었습니다!");
        } else {
            System.out.println("회원 ID가 유효하지 않습니다.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("회원 ID가 유효하지 않습니다.");
        }
    }
}
