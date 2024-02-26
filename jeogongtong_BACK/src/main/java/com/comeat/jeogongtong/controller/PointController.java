package com.comeat.jeogongtong.controller;


import com.comeat.jeogongtong.dto.PointResponseDto;
import com.comeat.jeogongtong.service.PointService;
import com.comeat.jeogongtong.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


// 만들기
@RestController
@RequiredArgsConstructor
@RequestMapping(path = "/point")
public class PointController {
    private final PointService pointService;

    @GetMapping("/all")
    public ResponseEntity<List<PointResponseDto>> getPointDetails(@RequestParam Long userId){
        // 해당 사용자의 포인트 내역 상세 조회
        List<PointResponseDto> pointResponseDtos = pointService.getPointDetailsByUserId(userId);
        return  ResponseEntity.ok(pointResponseDtos);
    }

}