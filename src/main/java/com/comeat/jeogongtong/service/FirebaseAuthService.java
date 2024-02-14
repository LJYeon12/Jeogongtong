package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.dto.UserRequestDto;
import com.comeat.jeogongtong.dto.UserResponseDto;
import com.comeat.jeogongtong.model.Users;
import com.comeat.jeogongtong.repository.UserRepository;

import java.util.Map;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public UserResponseDto AuthService(@RequestBody Map<String, String> payload) {
        try {
            String idToken = payload.get("idToken").toString();//firebase token from front
            FirebaseToken user = firebaseAuth.verifyIdToken(idToken);
            String nickname = payload.get("nickname").toString();
            if(userRepository.findByEmail(user.getEmail())==null){
                //회원가입
                UserRequestDto urd = new UserRequestDto(user.getEmail(),nickname,0,"ion");
                System.out.println("회원가입 : "+urd.getEmail());
                saveUser(urd);
                UserResponseDto res = new UserResponseDto(userRepository.findByEmail(user.getEmail()));
                return res;
            }else{
                //로그인
                Users login = new Users();
                login = userRepository.findByEmail(user.getEmail());
                System.out.println("로그인 : "+login.getEmail());
                UserResponseDto res = new UserResponseDto(login);
                return res;
            }

        } catch (FirebaseAuthException e) {
            e.printStackTrace();
        }

        return null; // 인증 실패 시 null 반환
    }
}
