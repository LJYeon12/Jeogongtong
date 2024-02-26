package com.comeat.jeogongtong.model;

import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@NoArgsConstructor //기본 생성자
@EqualsAndHashCode //두 객체 내용이 같은지, 두 객체가 같은 객체인지 비교
public class StudyMemberId implements Serializable {
    private Long user;
    private Long study;
}
