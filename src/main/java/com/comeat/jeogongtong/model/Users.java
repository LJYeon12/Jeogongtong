package com.comeat.jeogongtong.model;

import com.comeat.jeogongtong.dto.UserDto;
import jakarta.persistence.*;
import lombok.*;


import static jakarta.persistence.GenerationType.IDENTITY;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Users {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id")
    private Long userId;
    private String email;
    private String nickname;
    private int point;
    private String tear;

    public void setTear(int point) {
        this.point = point;
        if (point <= 300) {
            this.tear = "ion";
        } else if (point <= 4000) {
            this.tear = "bronze";
        } else if (point <= 9000) {
            this.tear = "silver";
        }else if (point <= 20000) {
            this.tear = "gold";
        }else if (point <= 60000) {
            this.tear = "platinum";
        }else if (point <= 100000) {
            this.tear = "diamond";
        }else if (point <= 300000) {
            this.tear = "legend";
        }
    }


    // 수정
    public void addPoints(int additionalPoints){
        this.point += additionalPoints;
    }
}
