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

    @Query(nativeQuery = true, value = "SELECT id,category,content,photo_url, regi_date, title, NULL AS asking_id,user_id FROM questions WHERE title LIKE CONCAT('%', ?1, '%') OR content LIKE CONCAT('%', ?1, '%') " +
            "UNION " +
            " SELECT id,category,content,photo_url, regi_date, title, asking_id,user_id FROM answers WHERE title LIKE CONCAT('%', ?1, '%') OR content LIKE CONCAT('%', ?1, '%')")
    List<Object[]> findQuestionsAnswersByKeyword(String keyword);

//    @Query("SELECT Questions FROM Questions UNION SELECT Answers FROM Answers")
//    List<Object[]> findQuestionsAnswersAll();


    @Query(nativeQuery = true, value = "SELECT id,category,content,photo_url, regi_date, title, NULL AS asking_id,user_id FROM questions " +
            "UNION " +
            " SELECT id,category,content,photo_url, regi_date, title, asking_id,user_id FROM answers ")
    List<Object[]> findQuestionsAndAnswers();


}
