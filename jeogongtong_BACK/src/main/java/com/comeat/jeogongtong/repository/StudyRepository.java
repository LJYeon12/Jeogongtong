package com.comeat.jeogongtong.repository;


import com.comeat.jeogongtong.model.StudyEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudyRepository extends JpaRepository<StudyEntity, Long> {
    List<StudyEntity> findByNameContainingIgnoreCase(String keyword);
}
