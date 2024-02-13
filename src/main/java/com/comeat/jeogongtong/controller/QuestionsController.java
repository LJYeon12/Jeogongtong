package com.comeat.jeogongtong.controller;

import com.comeat.jeogongtong.dto.QuestionRequestDto;
import com.comeat.jeogongtong.dto.QuestionResponseDto;
import com.comeat.jeogongtong.service.QuestionsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping(path = "/questions")
@RequiredArgsConstructor
@RestController
public class QuestionsController {

    private final QuestionsService questionsService;

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
}
