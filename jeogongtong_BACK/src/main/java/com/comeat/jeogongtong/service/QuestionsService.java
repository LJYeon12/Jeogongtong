package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.dto.QuestionRequestDto;
import com.comeat.jeogongtong.dto.QuestionResponseDto;
import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.model.Users;
import com.comeat.jeogongtong.repository.UserRepository;
import org.springframework.beans.BeanUtils;
import com.comeat.jeogongtong.repository.QuestionsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QuestionsService {
    private final QuestionsRepository questionsRepository;
    private final UserService userService;
    private final UserRepository userRepository;
    @Transactional
    public QuestionResponseDto qwrite(QuestionRequestDto requestDto, Users users){
        Questions questions = requestDto.toEntity();
        users.addPoints(100); // 사용자 포인트 100 증가
        userRepository.save(users); // 변경된 사용자 정보 저장

        return QuestionResponseDto.of(questions);
    }

    @Transactional
    public QuestionResponseDto updateWrite(Long id, QuestionRequestDto requestDto) {
        Questions exquestions = questionsRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
        BeanUtils.copyProperties(requestDto, exquestions, "id");

        Questions updatedQuestions = questionsRepository.save(exquestions);
        return QuestionResponseDto.of(updatedQuestions);
    }
    @Transactional
    public void deleteWrite(Long id) {
        questionsRepository.deleteById(id);
    }

    @Transactional
    public List<Object[]> searchKeyword(String keyword) {
        return questionsRepository.findQuestionsAnswersByKeyword(keyword);
    }
    @Transactional
    public List<Object[]> searchAll() {
        return questionsRepository.findQuestionsAndAnswers();
    }
}
