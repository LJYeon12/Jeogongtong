package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.dto.QuestionRequestDto;
import com.comeat.jeogongtong.dto.QuestionResponseDto;
import com.comeat.jeogongtong.model.Questions;
import org.springframework.beans.BeanUtils;
import com.comeat.jeogongtong.repository.QuestionsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class QuestionsService {
    private final QuestionsRepository questionsRepository;
    @Transactional
    public QuestionResponseDto qwrite(QuestionRequestDto requestDto){
        Questions questions = requestDto.toEntity();
        return QuestionResponseDto.of(questionsRepository.save(questions));
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
}
