package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.dto.AnswerRequestDto;
import com.comeat.jeogongtong.dto.AnswerResponseDto;
import com.comeat.jeogongtong.dto.QuestionRequestDto;
import com.comeat.jeogongtong.dto.QuestionResponseDto;
import com.comeat.jeogongtong.model.Answers;
import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.repository.AnswersRepository;
import com.comeat.jeogongtong.repository.QuestionsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AnswersService {
    private final AnswersRepository answersRepository;
    @Transactional
    public AnswerResponseDto awrite(AnswerRequestDto requestDto){
        Answers answers = requestDto.toEntity();
        return AnswerResponseDto.of(answersRepository.save(answers));
    }

    @Transactional
    public AnswerResponseDto updateAWrite(Long id, AnswerRequestDto requestDto) {
        Answers exanswers = answersRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
        BeanUtils.copyProperties(requestDto, exanswers, "id");
        Answers updatedAnswers = answersRepository.save(exanswers);

        return AnswerResponseDto.of(updatedAnswers);
    }
    @Transactional
    public void deleteAWrite(Long id) {
        answersRepository.deleteById(id);
    }

}
