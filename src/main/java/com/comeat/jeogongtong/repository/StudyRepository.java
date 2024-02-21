package com.comeat.jeogongtong.repository;


import com.comeat.jeogongtong.model.StudyEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudyRepository extends JpaRepository<StudyEntity, Long> {
    List<StudyEntity> findByNameContainingIgnoreCase(String keyword);
}
