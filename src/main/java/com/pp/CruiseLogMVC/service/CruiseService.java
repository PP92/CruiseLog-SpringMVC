package com.pp.CruiseLogMVC.service;

import com.github.javafaker.Faker;
import com.pp.CruiseLogMVC.entity.Cruise;
import com.pp.CruiseLogMVC.repository.CruiseRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
//@Transactional
public class CruiseService {

    @Autowired
    private CruiseRepository cruiseRepository;

    public List<Cruise> listAllCruises() {
        return cruiseRepository.findAll();

    }

    private final Logger logger = LoggerFactory.getLogger(CruiseService.class);


    public Cruise getRandomCruise() {
        Faker faker = new Faker();
        Random random = new Random();
        Cruise randomCruise = new Cruise();
        String captainName = faker.name().fullName();
        String yacht = "S/Y " + faker.name().firstName();
        int distance = random.nextInt(100) + 100;

        List<String> locations = new ArrayList<>();
        locations.add("Morze Północne");
        locations.add("Atlantyk");
        locations.add("Morze Śródziemne");
        locations.add("Bałtyk");
        locations.add("Morze Egejskie");
        locations.add("Adriatyk");

        String location = locations.get(random.nextInt(locations.size()));

        RandomDate rd = new RandomDate(LocalDate.of(2010, 1, 1), LocalDate.of(2019, 1, 1));
        LocalDate startDate = rd.nextDate();
        LocalDate endDate = startDate.plusDays(7);

        randomCruise.setCaptainName(captainName);
        randomCruise.setYachtName(yacht);
        randomCruise.setLocation(location);
        randomCruise.setDistance(distance);
        randomCruise.setStartDate(startDate);
        randomCruise.setEndDate(endDate);
        logger.info("Wylosowano rejs - kapitan: " + randomCruise.getCaptainName());
        logger.info(randomCruise.toString());
        return randomCruise;
    }

    public void initCruiseRepo() {
        for (int i = 0; i < 5; i++) {
            Cruise cruise = getRandomCruise();
            cruiseRepository.save(cruise);
        }
    }

    public Cruise saveRandomCruise() {
        return (Cruise)cruiseRepository.save(getRandomCruise());
    }

    public List<Cruise> getAllCruises() {
        return cruiseRepository.findAll();
    }

    public Cruise getCruise(Long id) {
        return (Cruise)cruiseRepository.findById(id).get();
    }

    public Cruise saveCruise(Cruise cruise) {
        return (Cruise)cruiseRepository.save(cruise);
    }

    public Cruise updateCruiseById(Cruise newCruise, Long id) {
        newCruise.setId(id);
        return (Cruise)cruiseRepository.save(newCruise);
    }

    public void deleteCruiseById(Long id) {
        cruiseRepository.deleteById(id);
    }

    public List<Cruise> findCruiseByDistanceGreaterThan(int distance){
        List<Cruise> cruises = cruiseRepository.findCruisesByDistanceGreaterThan(distance);
        return cruises;
    }

    public List<Cruise> findCruisesByStartDateAfter(LocalDate startDate){
        List<Cruise> cruises = cruiseRepository.findCruisesByStartDateAfter(startDate);
        return cruises;
    }
}
