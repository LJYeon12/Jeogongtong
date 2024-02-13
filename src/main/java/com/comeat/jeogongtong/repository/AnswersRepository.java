package com.comeat.jeogongtong.repository;

import com.comeat.jeogongtong.model.Answers;
import com.comeat.jeogongtong.model.Questions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AnswersRepository extends JpaRepository<Answers,Long> {
    Answers findByTitle(@Param("title") String title);
    Answers findByContent(String content);
    Optional<Answers> findById(Long id);

}