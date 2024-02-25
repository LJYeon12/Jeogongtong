package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.dto.UserRankDto;
import com.comeat.jeogongtong.model.StudyMemberEntity;
import com.comeat.jeogongtong.repository.StudyMemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
@RequiredArgsConstructor
public class RankingService {
    private final StudyMemberRepository studyMemberRepository;

    // 스터디 방 랭킹 조회
    // 스터디 방 랭킹 조회
    public List<UserRankDto> getRank(Long studyId) {
        // StudyMemberEntity에서 studyId로 모든 멤버를 조회, 저장된 랭킹 순서대로 정렬
        List<StudyMemberEntity> members = studyMemberRepository.findByStudy_StudyIdOrderByRankAsc(studyId);

        // UserRankDto 리스트 생성
        List<UserRankDto> rankings = new ArrayList<>();
        for (StudyMemberEntity member : members) {
            rankings.add(new UserRankDto(
                    member.getUser().getUserId(),
                    member.getUser().getNickname(),
                    member.getRank(),
                    member.getWeektime()
            ));
        }
        return rankings;
    }
}