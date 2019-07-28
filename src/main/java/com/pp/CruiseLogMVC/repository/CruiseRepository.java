package com.pp.CruiseLogMVC.repository;

import com.pp.CruiseLogMVC.entity.Cruise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface CruiseRepository extends JpaRepository<Cruise, Long> {
    public List<Cruise> findCruisesByDistanceGreaterThan(int distnace);
    public List<Cruise> findCruisesByStartDateAfter(LocalDate startDate);
}
