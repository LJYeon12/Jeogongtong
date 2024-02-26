package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.model.StudyEntity;
import com.comeat.jeogongtong.model.StudyMemberEntity;
import com.comeat.jeogongtong.repository.StudyMemberRepository;
import com.comeat.jeogongtong.repository.StudyRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Time;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;


@Service
@RequiredArgsConstructor
public class TimerService {
    private final StudyMemberRepository studyMemberRepository;
    private final StudyRepository studyRepository;
    //스터디 멤버 찾기
    private StudyMemberEntity findStudyMember(Long userId, Long studyId){
        return studyMemberRepository.findByUser_UserIdAndStudy_StudyId(userId, studyId)
                .orElseThrow(() -> new EntityNotFoundException("StudyMember not found"));
    }

    @Transactional
    public Long updateStudyTime(Long userId, Long studyId, Long weektime) {
        StudyEntity studyEntity = studyRepository.findById(studyId)
                .orElseThrow(()->new EntityNotFoundException("Study not found"));

        StudyMemberEntity studyMember = findStudyMember(userId, studyId);
        // 현 날짜와 스터디 생성 날짜 비교
        long weekBetween = ChronoUnit.WEEKS.between(studyEntity.getCreatedTime(), LocalDate.now());


        // weektime 업데이트
        Long newWeekTime = studyMember.getWeektime() + weektime;
        studyMember.setWeektime(newWeekTime);
        studyMemberRepository.save(studyMember);
        return newWeekTime;
    }
    // 수정
    // 매일 자정에 실행되는 스케줄링된 작업 (일주일 누적시간 초기화)
    @Scheduled(cron = "0 0 0 * * *") // 매일 자정 실행
    public void resetWeektime() {
        List<StudyEntity> allStudies = studyRepository.findAll();
        LocalDate now = LocalDate.now();
        for (StudyEntity study : allStudies) {
            long daysSinceCreated = ChronoUnit.DAYS.between(study.getCreatedTime(), now);
            if (daysSinceCreated % 7 == 0) { // 매주 첫날인 경우
                List<StudyMemberEntity> members = studyMemberRepository.findByStudy_StudyIdOrderByWeektimeDesc(study.getStudyId());
                for (int i = 0; i < members.size(); i++) {
                    StudyMemberEntity member = members.get(i);
                    member.setRank(i + 1); // 누적 랭킹 업데이트
                    // 주당 평균 공부 시간 계산 (초 단위)
                    long averageWeeklyTimeInSeconds = member.getWeektime() / 7;
                    // 포인트 계산 (시간 단위로 변환 후 100을 곱함)
                    int points = (int) (averageWeeklyTimeInSeconds / 3600.0 * 100);
                    // 사용자 포인트에 추가
                    member.getUser().addPoints(points);
                    // weektime 리셋
                    member.setWeektime(0L);
                    studyMemberRepository.save(member);
                }
            }
        }

    }
}