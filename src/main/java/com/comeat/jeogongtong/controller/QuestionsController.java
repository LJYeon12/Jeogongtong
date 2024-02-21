package com.comeat.jeogongtong.controller;

import com.comeat.jeogongtong.dto.AnswerRequestDto;
import com.comeat.jeogongtong.dto.AnswerResponseDto;
import com.comeat.jeogongtong.dto.QuestionRequestDto;
import com.comeat.jeogongtong.dto.QuestionResponseDto;
import com.comeat.jeogongtong.service.AnswersService;
import com.comeat.jeogongtong.service.QuestionsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequestMapping(path = "/questions")
@RequiredArgsConstructor
@RestController
public class QuestionsController {

    private final QuestionsService questionsService;
    private final AnswersService answersService;


    //질문답변 전체 조회
    @GetMapping("/all")
    public List<Object[]> searchAll() {
        List<Object[]> result = questionsService.searchAll();
        return result;
    }

    //질문
    @PostMapping("/asking-write")
    public ResponseEntity<QuestionResponseDto> QuestionWrite(@RequestBody QuestionRequestDto requestDto){
        return ResponseEntity.ok(questionsService.qwrite(requestDto));
    }
    @PatchMapping("/edit/{id}")
    public ResponseEntity<QuestionResponseDto> updateWrite(@PathVariable Long id, @RequestBody QuestionRequestDto requestDto) {
        QuestionResponseDto updatedWrite = questionsService.updateWrite(id, requestDto);
        return ResponseEntity.ok(updatedWrite);
    }
    @DeleteMapping("/delete/{id}")
    public String DeleteWrite(@PathVariable Long id) {
        questionsService.deleteWrite(id);
        return id+"번 게시글이 삭제되었습니다.";
    }
    //답변
    @PostMapping("/answer-write")
    public ResponseEntity<AnswerResponseDto> AnswerWrite(@RequestBody AnswerRequestDto requestDto){
        return ResponseEntity.ok(answersService.awrite(requestDto));
    }
    @PatchMapping("/answer-edit/{id}")
    public ResponseEntity<AnswerResponseDto> updateAWrite(@PathVariable Long id, @RequestBody AnswerRequestDto requestDto) {
        AnswerResponseDto updatedAWrite = answersService.updateAWrite(id, requestDto);
        return ResponseEntity.ok(updatedAWrite);
    }
    @DeleteMapping("/answer-delete/{id}")
    public String DeleteAWrite(@PathVariable Long id) {
        answersService.deleteAWrite(id);
        return id+"번 답변이 삭제되었습니다.";
    }

    //통합검색
    @GetMapping("/search/{keyword}")
    public List<Object[]> searchKeyword(@PathVariable String keyword) {
        List<Object[]> result = questionsService.searchKeyword(keyword);
        return result;
    }
}
