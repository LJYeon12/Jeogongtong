package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.model.Users;
import com.comeat.jeogongtong.repository.UserRepository;
import com.comeat.jeogongtong.dto.StudyDto;
import com.comeat.jeogongtong.model.StudyEntity;
import com.comeat.jeogongtong.repository.StudyRepository;
import com.comeat.jeogongtong.model.StudyMemberEntity;
import com.comeat.jeogongtong.repository.StudyMemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor //의존성 주입
public class StudyMemberService {
    private final StudyMemberRepository studyMemberRepository;
    private final UserRepository UserRepository; //Users를 조회해 스터디 멤버에 등록
    private final StudyRepository studyRepository; //StudyEnetity를 조회해 스터디 멤버에 등록
    public  void addStudyMember(Long userId, Long studyId) { //스터디 신청
        Users users = UserRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Invailid user ID : " + userId));
        StudyEntity studyEntity = studyRepository.findById(studyId)
                .orElseThrow(() -> new IllegalArgumentException("Invaild study ID : " + studyId));
        // 스터디 멤버 수
        int memberCount = studyMemberRepository.countByStudy_StudyId(studyId);
        StudyMemberEntity studyMemberEntity = new StudyMemberEntity();
        studyMemberEntity.setUser(users);
        studyMemberEntity.setStudy(studyEntity);
        studyMemberEntity.setWeektime(0L);
        studyMemberEntity.setRank(memberCount + 1); //등록 시 랭킹은 마지막
        studyMemberEntity.setState("회원");

        studyMemberRepository.save(studyMemberEntity); // 스터디 멤버 DB에 저장
    }

    public List<StudyDto> findMyStudies(Long userId){
        List<StudyMemberEntity> studyMember = studyMemberRepository.findByUser_UserId(userId);
        return studyMember.stream()
                .map(studyMemberEntity -> StudyDto.toStudyDto(studyMemberEntity.getStudy()))
                .collect(Collectors.toList());

    }
}
