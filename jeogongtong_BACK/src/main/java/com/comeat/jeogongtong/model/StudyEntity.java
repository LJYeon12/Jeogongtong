package com.comeat.jeogongtong.model;

import com.comeat.jeogongtong.dto.RegistRequestDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "study")
public class StudyEntity extends BaseEntity {
//   DB와 동일한 순서로 설정
    @Id //pk 컬럼 지정
    @GeneratedValue(strategy = GenerationType.IDENTITY) //increment_auto (숫자 자동 증가)
    @Column(name = "study_id")
    private Long studyId;
    @Column(length = 100,nullable = false)
    private String name;
    @Column
    private String book;

    @Column //nullable = false : 에러발생
    private String category;
    @Column(nullable = false)
    private String settingPeriod;
    @Column
    private int rankerAsk; //질의응답 타입을 int로?
    @Column
    private int rankerAnswer;
    @Column(length = 500)
    private String intro;

//    @ManyToOne
//    @JoinColumn(name = "admin_email")
//    private Users users;


    public static StudyEntity tostudyEntity(RegistRequestDto registRequestDto) {
        StudyEntity studyEntity = new StudyEntity();
        studyEntity.setName(registRequestDto.getName());
        studyEntity.setBook(registRequestDto.getBook());
        studyEntity.setCategory(registRequestDto.getCategory());
        studyEntity.setSettingPeriod(registRequestDto.getSettingPeriod());
        studyEntity.setRankerAsk(registRequestDto.getRankerAsk());
        studyEntity.setRankerAnswer(registRequestDto.getRankerAnswer());
        studyEntity.setIntro(registRequestDto.getIntro());
        //studyEntity.setUsers(registRequestDto.getUsers());
        return studyEntity;
    }
}
