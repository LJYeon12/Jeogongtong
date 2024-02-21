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
    private Integer point;
    private String tear;

    public Users toEntity() {
        Users user = new Users();
        user.setEmail(this.email);
        user.setNickname(this.nickname);
        user.setTear(this.point);
        user.setPoint(this.point);
        return user;
    }
}