package co.edu.unal.sam.physicalactivity.model.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import co.edu.unal.sam.aspect.model.enumerator.StateEnum;
import co.edu.unal.sam.physicalactivity.model.domain.Activity;

public interface ActivityRepository extends CrudRepository<Activity, Long> {

    List<Activity> findByState(StateEnum state);
}
