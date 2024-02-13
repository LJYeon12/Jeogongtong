package com.comeat.jeogongtong.repository;

import com.comeat.jeogongtong.model.Questions;
import com.comeat.jeogongtong.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface QuestionsRepository extends JpaRepository<Questions,Long> {
    Questions findByTitle(@Param("title") String title);
    Questions findByContent(String content);
    Optional<Questions> findById(Long id);

    @Query("SELECT q, a FROM Questions q FULL JOIN Answers a WHERE q.title LIKE %:keyword% OR q.content LIKE %:keyword% OR a.title LIKE %:keyword% OR a.content LIKE %:keyword%")
    List<Object[]> findQuestionsAnswersByKeyword(String keyword);
}
