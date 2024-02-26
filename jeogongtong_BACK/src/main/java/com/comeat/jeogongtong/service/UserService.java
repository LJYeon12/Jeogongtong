package com.comeat.jeogongtong.service;

import com.comeat.jeogongtong.dto.UserDto;
import com.comeat.jeogongtong.model.Users;
import com.comeat.jeogongtong.repository.UserRepository;
import com.comeat.jeogongtong.dto.StudyMemberDto;
import com.comeat.jeogongtong.model.StudyMemberEntity;
import com.comeat.jeogongtong.repository.StudyMemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final StudyMemberRepository studyMemberRepository;
    public UserDto login(UserDto userDto) {
        Optional<Users> byUserEmail = Optional.ofNullable(userRepository.findByEmail(userDto.getEmail()));
        if (byUserEmail.isPresent()){
            Users users = byUserEmail.get();
            UserDto loginUser = userDto.toUserDto(users);
            return loginUser;
        } else return null;
    }

    public UserDto findById(Long userId) {
        Optional<Users> optionalUsers = userRepository.findById(userId);
        if(optionalUsers.isPresent()){
            return UserDto.toUserDto(optionalUsers.get());
        } else {
            return null;
        }
    }

    public Optional<Users> findUsersById(Long userId) {
        return userRepository.findById(userId);
    }

    /*사용자 스터디 랭킹 조회 -> 마이페이지에 랭킹 출력*/
    public List<StudyMemberDto> findStudyRankByUserId(Long userId){
        List<StudyMemberEntity> studyMember = studyMemberRepository.findByUser_UserId(userId);
        return studyMember.stream()
                .map(StudyMemberDto::toStudyMemberDto)
                .collect(Collectors.toList());
    }
}
