package com.comeat.jeogongtong.controller;

import com.comeat.jeogongtong.dto.TimerRequestDto;
import com.comeat.jeogongtong.dto.TimerResponseDto;
import com.comeat.jeogongtong.dto.UserRankDto;
import com.comeat.jeogongtong.service.RankingService;
import com.comeat.jeogongtong.service.TimerService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Getter
@Setter
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/timer")
public class TimerController {
    private final TimerService timerService;
    private final RankingService rankingService;

    // 타이머 종료 시간을 받아와서 처리
    @PutMapping("{studyId}/end")
    public ResponseEntity<TimerResponseDto> endTimer(@RequestBody TimerRequestDto timerRequestDto) {

        Long updatedTime = timerService.updateStudyTime(timerRequestDto.getUserId(), timerRequestDto.getStudyId(), timerRequestDto.getWeektime());

        TimerResponseDto timerResponseDto = new TimerResponseDto(true, "Timer updated successfully", timerRequestDto.getUserId(), timerRequestDto.getStudyId(), updatedTime);
        return ResponseEntity.ok(timerResponseDto);
    }

    @GetMapping("/ranking/{studyId}") //스터디 전체 랭킹 조회
    public ResponseEntity<List<UserRankDto>> getRanking(@PathVariable Long studyId) {
        // 랭킹 조회 로직
        List<UserRankDto> rankings = rankingService.getRank(studyId);
        return ResponseEntity.ok(rankings); // 상태코드 200과 함께 랭킹 데이터 반환
    }
}

