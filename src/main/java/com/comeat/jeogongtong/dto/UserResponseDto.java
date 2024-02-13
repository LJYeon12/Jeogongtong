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

    public UserResponseDto(Users user) {
        this.id = user.getId();
        this.email = user.getEmail();
        this.nickname = user.getNickname();
    }
}