package com.comeat.jeogongtong.repository;

import com.comeat.jeogongtong.model.Users;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<Users,Long> {
    Users findByEmail(@Param("email") String email);
    Users findByNickname(String nickname);
    Optional<Users> findById(Long id);
}
