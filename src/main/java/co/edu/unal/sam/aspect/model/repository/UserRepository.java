package co.edu.unal.sam.aspect.model.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import co.edu.unal.sam.aspect.model.domain.User;
import co.edu.unal.sam.physicalactivity.model.dto.GoalDto;
import co.edu.unal.sam.physicalactivity.model.dto.UserDto;

public interface UserRepository extends PagingAndSortingRepository<User, Long> {

    User findByIdentityDocumentOrUsername(String document, String username);

    User findByUsername(String username);

    @Query(name = "User.findUserDtoByUsername")
    List<UserDto> findUserDtoByUsername(@Param("username") String username, Pageable pageable);

    @Query(name = "User.findGoalDtoByUser")
    List<GoalDto> findGoalDtoByUser(@Param("user") User user);
}
