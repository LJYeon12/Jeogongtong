package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.dto.UserRequestDto;
import com.comeat.jeogongtong.dto.UserResponseDto;
import com.comeat.jeogongtong.model.Users;
import com.comeat.jeogongtong.repository.UserRepository;

import java.util.HashMap;
import java.util.Map;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

@Service
@RequiredArgsConstructor
public class FirebaseAuthService {

    private final FirebaseAuth firebaseAuth;
    private final UserRepository userRepository;

    public void saveUser(UserRequestDto dto) {
        Users user = new Users();
        user.setNickname(dto.getNickname());
        user.setEmail(dto.getEmail());
        userRepository.save(user);
    }

    @Transactional
    public UserResponseDto updateAuth(Users users) {
        Users user = userRepository.findByEmail(users.getEmail());
        BeanUtils.copyProperties(users, user, "email");
        Users updatedUsers = userRepository.save(user);
        return new UserResponseDto(updatedUsers);
    }

    public ResponseCookie createCookie(String key, String value){
        return ResponseCookie.from(key, value)
                .maxAge(1 * 60 * 60 * 24 * 365)
                .sameSite("Lax")
                .httpOnly(true)
                .secure(true)
                .path("/")
                .build();
    }

    public ResponseEntity<Map<String, String>> AuthService(@RequestBody Map<String, String> payload) {
        try {
            String idToken = payload.get("idToken").toString();//firebase token from front
            FirebaseToken user = firebaseAuth.verifyIdToken(idToken);
            String nickname = payload.get("nickname").toString();
            if(userRepository.findByEmail(user.getEmail())==null){
                //회원가입
                UserRequestDto urd = new UserRequestDto(user.getEmail(),nickname,0,"ion");
                System.out.println("회원가입 : "+urd.getEmail());
                saveUser(urd);
                Map<String, String> respMap = new HashMap<>();
                respMap.put("email", user.getEmail());
                ResponseCookie cookie = createCookie("UserToken", idToken);
                return ResponseEntity.ok()
                        .header(HttpHeaders.SET_COOKIE, cookie.toString())
                        .body(respMap);

//                UserResponseDto res = new UserResponseDto(userRepository.findByEmail(user.getEmail()));
//                return res;
            }else{
                //로그인
                Users login = new Users();
                login = userRepository.findByEmail(user.getEmail());
                login.setTear(login.getPoint());
                updateAuth(login);//로그인마다 티어 새로고침

                System.out.println("로그인 : "+login.getEmail());
                Map<String, String> respMap = new HashMap<>();
                respMap.put("email", user.getEmail());

                ResponseCookie cookie = ResponseCookie.from("UserToken", idToken)
                        .maxAge(24 * 60 * 60) // 유효 기간: 1일
                        .httpOnly(true) // JavaScript를 통한 접근 방지
                        .secure(true) // HTTPS 통신에서만 쿠키 전송
                        .path("/") // 모든 경로에서 쿠키 사용
                        .build();


                // ResponseEntity에 쿠키 추가 및 반환
                return ResponseEntity.ok()
                        .header(HttpHeaders.SET_COOKIE, cookie.toString())
                        .body(respMap);
//                UserResponseDto res = new UserResponseDto(login);
//                return res;
            }

        } catch (FirebaseAuthException e) {
            e.printStackTrace();
        }

        return null; // 인증 실패 시 null 반환
    }
}
