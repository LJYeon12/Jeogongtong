package com.comeat.jeogongtong.dto;


import com.comeat.jeogongtong.model.Users;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class UserRequestDto {
    private String email;
    private String nickname;

    public Users toEntity() {
        Users user = new Users();
        user.setEmail(this.email);
        user.setNickname(this.nickname);
        return user;
    }
}