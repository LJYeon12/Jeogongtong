package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.dto.PointResponseDto;
import com.comeat.jeogongtong.model.Answers;
import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.model.StudyMemberEntity;
import com.comeat.jeogongtong.repository.AnswersRepository;
import com.comeat.jeogongtong.repository.QuestionsRepository;
import com.comeat.jeogongtong.repository.StudyMemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

// 만듬
@Service
@RequiredArgsConstructor
public class PointService {
    private final QuestionsRepository questionsRepository;
    private final AnswersRepository answersRepository;
    private final StudyMemberRepository studyMemberRepository;
    // 포인트 내역 조회
    public List<PointResponseDto> getPointDetailsByUserId(Long userId) {
        List<PointResponseDto> pointDetails = new ArrayList<>();

        List<Questions> userQuestions = questionsRepository.findByUsers_UserId(userId);
        for (Questions questions : userQuestions){
            pointDetails.add(new PointResponseDto(
                    questions.getId(),
                    "질문",
                    questions.getRegiDate(),
                    100L
            ));
        }

        List<Answers> userAnswers = answersRepository.findByUsers_UserId(userId);
        for (Answers answers : userAnswers) {
            pointDetails.add(new PointResponseDto(
                    answers.getId(),
                    "답변",
                    answers.getRegiDate(),
                    100L
            ));
        }

        // 주간 학습 시간에 대한 포인트 지급 추론

        List<StudyMemberEntity> studyMembers = studyMemberRepository.findByUser_UserId(userId);
        studyMembers.forEach(studyMember -> {
            // 포인트 계산 로직 (예시로, weektime을 기반으로 계산)
            Long pointsForWeektime = studyMember.getWeektime() / 3600; // 가정: 1시간 학습당 1포인트
            pointDetails.add(new PointResponseDto(null, "주간 학습 시간", LocalDate.now().toString(), pointsForWeektime));
        });
        return pointDetails;
    }
}