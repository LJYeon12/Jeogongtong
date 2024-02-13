package com.comeat.jeogongtong.security;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import java.io.IOException;
import java.io.InputStream;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

@Configuration
@RequiredArgsConstructor
public class FirebaseConfig {
    
    @Bean
    public FirebaseAuth firebaseAuth() throws IOException {
        // FileInputStream serviceAccount =
        //         new FileInputStream("classpath:jeogongtong-firebase-adminsdk.json");

        InputStream serviceAccount = getClass().getResourceAsStream("/jeogongtong-firebase-adminsdk.json");

        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                .build();

        FirebaseApp.initializeApp(options);
        return FirebaseAuth.getInstance();
    }
//
//    @Bean
//    public AuthenticationProvider firebaseAuthenticationProvider() throws IOException {
//        return new FirebaseAuthenticationProvider(firebaseAuth());
//    }
//
//    public class FirebaseAuthenticationProvider implements AuthenticationProvider {
//
//        private final FirebaseAuth firebaseAuth;
//
//        public FirebaseAuthenticationProvider(FirebaseAuth firebaseAuth) {
//            this.firebaseAuth = firebaseAuth;
//        }
//
//        @Override
//        public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//            String idToken = (String) authentication.getCredentials();
//
//            try {
//                FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(idToken);
//                // 사용자 인증 성공 시
//                // 추가 작업 수행 또는 성공 응답 반환
//                return new UsernamePasswordAuthenticationToken(firebaseToken, null, null);
//            } catch (Exception e) {
//                // 사용자 인증 실패 시
//                // 에러 처리
//                throw new RuntimeException("Authentication failed", e);
//            }
//        }
//
//        @Override
//        public boolean supports(Class<?> authentication) {
//            return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
//        }
//    }
//
}
