package com.comeat.jeogongtong.repository;

import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface QuestionsRepository extends JpaRepository<Questions,Long> {
    Questions findByTitle(@Param("title") String title);
    Questions findByContent(String content);
    Optional<Questions> findById(Long id);
}
