package com.comeat.jeogongtong.repository;

import com.comeat.jeogongtong.model.StudyMemberEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface StudyMemberRepository extends JpaRepository<StudyMemberEntity, Long> {
    List<StudyMemberEntity> findByUser_UserId(Long userId);
    List<StudyMemberEntity> findByStudy_StudyIdOrderByWeektimeDesc(Long studyId);
    List<StudyMemberEntity> findByStudy_StudyIdOrderByRankAsc(Long studyId); // 랭킹 순으로 정렬된 멤버 조회
    int countByStudy_StudyId(Long studyId); // 스터디 멤버 수 확인
    Optional<StudyMemberEntity> findByUser_UserIdAndStudy_StudyId(Long userId, Long studyId);
}
