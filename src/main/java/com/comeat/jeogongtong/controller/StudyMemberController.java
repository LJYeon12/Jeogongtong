package com.comeat.jeogongtong.controller;

import com.comeat.jeogongtong.model.StudyMemberEntity;
import com.comeat.jeogongtong.repository.StudyMemberRepository;
import com.comeat.jeogongtong.repository.UserRepository;
import com.comeat.jeogongtong.service.StudyMemberService;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
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
    private final FirebaseAuth firebaseAuth;
    private final StudyMemberRepository studyMemberRepository;
    private final UserRepository userRepository;
    /*
    * 스터디 신청*/
    @PostMapping("/apply")
    public ResponseEntity<?> apply(@RequestParam Long studyId,@RequestHeader(value = "Authorization") String authHeader) {
        try {
            String idToken = authHeader.split("Bearer ")[1];
            FirebaseToken user = firebaseAuth.getInstance().verifyIdToken(idToken);
            String email = user.getEmail();
            if (email != null) {
                studyMemberService.addStudyMember(email, studyId);
                System.out.println("스터디 등록이 완료되었습니다!");
                return ResponseEntity.ok().body("스터디 등록이 완료되었습니다!");
            } else {
                System.out.println("회원 ID가 유효하지 않습니다.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("회원 ID가 유효하지 않습니다.");
            }
        } catch (FirebaseAuthException e) {
            System.out.println("Firebase 토큰이 유효하지 않습니다.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Firebase 토큰이 유효하지 않습니다.");
        }
    }

    @GetMapping("/studyMember")
    public ResponseEntity<?> getApply(@RequestHeader(value = "Authorization") String authHeader) {
        try {
            String idToken = authHeader.split("Bearer ")[1];
            FirebaseToken user = firebaseAuth.getInstance().verifyIdToken(idToken);
            String email = user.getEmail();
            Long uid = userRepository.findByEmail(email).getUserId();
            if (uid != null) {
                studyMemberService.findMyStudies(uid);

                return ResponseEntity.ok().body("스터디 조회 : "+email);
            } else {
                System.out.println("회원 ID가 유효하지 않습니다.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("회원 ID가 유효하지 않습니다.");
            }
        } catch (FirebaseAuthException e) {
            System.out.println("Firebase 토큰이 유효하지 않습니다.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Firebase 토큰이 유효하지 않습니다.");
        }
    }

}
