package com.comeat.jeogongtong.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.*;

import java.util.List;
import java.util.Optional;

import static jakarta.persistence.GenerationType.IDENTITY;
import static lombok.AccessLevel.PROTECTED;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Users {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;
    private String email;
    private String nickname;
    private Integer point;
    private String tear;

    public void setPoint(int point) {
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
}
