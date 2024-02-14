package com.comeat.jeogongtong.dto;


import com.comeat.jeogongtong.model.Users;
import lombok.*;


@AllArgsConstructor
@Builder
@Data
@NoArgsConstructor
public class UserResponseDto {
    private Long id;
    private String email;
    private String nickname;
    private Integer point;
    private String tear;

    public UserResponseDto(Users user) {
        this.id = user.getId();
        this.email = user.getEmail();
        this.nickname = user.getNickname();
        this.point =user.getPoint();
        this.tear = user.getTear();
    }
}