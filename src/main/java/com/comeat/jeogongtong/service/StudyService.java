package com.comeat.jeogongtong.service;

//import com.comeat.jeogongtong.study.StudyRepository;
import com.comeat.jeogongtong.dto.QuestionResponseDto;
import com.comeat.jeogongtong.dto.RegistRequestDto;
import com.comeat.jeogongtong.dto.RegistResponseDto;
import com.comeat.jeogongtong.model.Users;
import com.comeat.jeogongtong.dto.StudyDto;
import com.comeat.jeogongtong.model.StudyEntity;
import com.comeat.jeogongtong.repository.StudyRepository;
import com.comeat.jeogongtong.model.StudyMemberEntity;
import com.comeat.jeogongtong.repository.StudyMemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;


// DtO를 Entity로 Entity를 Dto로 바꿔주는 역할

@Service
@RequiredArgsConstructor
public class StudyService {
    private final StudyRepository studyRepository; //기능 구현 자체에는 문제 없음
    private final StudyMemberRepository studyMemberRepository;
    private final UserService userService;

    public void regist(RegistRequestDto registRequestDto)  { //Long userId
        StudyEntity studyEntity = StudyEntity.tostudyEntity(registRequestDto);
        studyRepository.save(studyEntity); //자동으로 스터디 레포지토리에 상속
        //현재 로그인한 사용자의 Users 조회
//        Users Users = userService.findUsersById(userId)
//                .orElseThrow(() -> new IllegalArgumentException("Invalid user ID : " + userId));

        // 스터디 멤버 엔티티 생성 및 설정
//        StudyMemberEntity studyMemberEntity = new StudyMemberEntity();
//        studyMemberEntity.setUser(Users);
//        studyMemberEntity.setStudy(studyEntity);
//        studyMemberEntity.setWeektime(0L);
//        studyMemberEntity.setRank(1); //수정해야됨
//        studyMemberEntity.setState("방장");

//        studyMemberRepository.save(studyMemberEntity);
    }


    //entity 객체를 dto에 옮겨 담음으로 dto파일에 작성
    public List<StudyDto> findAll() {
        List<StudyEntity> studyEntityList = studyRepository.findAll();
        List<StudyDto> studyDtoList = new ArrayList<>();
        for (StudyEntity studyEntity : studyEntityList) {
            studyDtoList.add(StudyDto.toStudyDto(studyEntity));
        }
        return studyDtoList;
    }

    public List<StudyDto> search(String keyword) {
        List<StudyEntity> studyEntityList = studyRepository.findByNameContainingIgnoreCase(keyword);
        List<StudyDto> studyDtoList = new ArrayList<>();
        for (StudyEntity studyEntity : studyEntityList) {
            studyDtoList.add(StudyDto.toStudyDto(studyEntity));
        }
        return studyDtoList;
    }

    public StudyDto findById(Long studyId) {
        StudyEntity studyEntity = studyRepository.findById(studyId)
                .orElseThrow(() -> new RuntimeException("Study not found with id: " + studyId));
        return StudyDto.toStudyDto(studyEntity);
    }
}
