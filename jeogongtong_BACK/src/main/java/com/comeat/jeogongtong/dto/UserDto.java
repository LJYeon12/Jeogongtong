package com.comeat.jeogongtong.dto;

import com.comeat.jeogongtong.model.Users;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserDto {
    private Long userId;
    private String nickname;
    private Integer point;
    private String tier;
    private String email;

    public static UserDto toUserDto(Users users){
        UserDto userDto = new UserDto();
        userDto.setUserId(users.getUserId());
        userDto.setNickname(users.getNickname());
        userDto.setPoint(users.getPoint());
        userDto.setTier(users.getTear());
        userDto.setEmail(users.getEmail());
        return userDto;
    }
}
