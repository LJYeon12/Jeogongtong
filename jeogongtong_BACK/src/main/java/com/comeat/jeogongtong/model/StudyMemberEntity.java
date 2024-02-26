package com.comeat.jeogongtong.model;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.context.annotation.Bean;

import java.sql.Time;

@Entity
@Table(name = "study_member")
@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
@IdClass(StudyMemberId.class)
public class StudyMemberEntity {
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", insertable = false, updatable = false)
    private Users user;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "study_id", insertable = false, updatable = false)
    private StudyEntity study; 

    @Column(name = "weektime")
    private Long weektime;

    @Column(name = "`rank`")
    private Integer rank;

    @Column(name = "state")
    private String state;
}
