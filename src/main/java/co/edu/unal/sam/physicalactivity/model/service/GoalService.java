package co.edu.unal.sam.physicalactivity.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import co.edu.unal.sam.aspect.model.domain.User;
import co.edu.unal.sam.aspect.model.enumerator.StateEnum;
import co.edu.unal.sam.aspect.model.repository.UserRepository;
import co.edu.unal.sam.physicalactivity.model.domain.Goal;
import co.edu.unal.sam.physicalactivity.model.domain.UserGoalActivity;
import co.edu.unal.sam.physicalactivity.model.dto.ActivityDto;
import co.edu.unal.sam.physicalactivity.model.dto.GoalDto;
import co.edu.unal.sam.physicalactivity.model.dto.Statistic;
import co.edu.unal.sam.physicalactivity.model.repository.GoalRepository;
import co.edu.unal.sam.physicalactivity.model.repository.UserGoalActivityRepository;
import co.sabit.commons.utils.Dates;

@Component
public class GoalService {

    @Inject
    private GoalRepository goalRepository;

    @Inject
    private UserGoalActivityRepository userGoalActivityRepository;

    @Inject
    private UserRepository userRepository;

    @Inject
    private UserService userService;

    public List<GoalDto> getGoals(Long userId, Boolean selected) {
        User user = this.userService.verify(userId);
        List<GoalDto> goals;
        if (Boolean.TRUE.equals(selected)) {
            List<UserGoalActivity> userGoals = this.userGoalActivityRepository
                    .findByUserAndDateRegister(user, Dates.getFirstDayOfWeek());
            goals = this.userRepository.findGoalDtoByUser(user);
            for (GoalDto g : goals) {
                for (UserGoalActivity uga : userGoals) {
                    if (g.getActivity().getId().equals(uga.getActivity().getId())) {
                        g.setMinutes(uga.getMinutes());
                        g.setDays(uga.getDays());
                        break;
                    }
                }
            }
        } else {
            goals = this.getGoals(user);
        }
        return goals;
    }

    public List<GoalDto> getGoals(User user) {
        List<ActivityDto> activites = this.userService.getActivities(user, StateEnum.ACTIVE, true);
        Iterable<Goal> goals = this.goalRepository.findAll();
        Iterable<Goal> goalsUser = user.getGoals();
        List<GoalDto> goalsDto = new ArrayList<>(0);
        GoalDto dto = null;
        for (Goal g : goals) {
            dto = new GoalDto(new ActivityDto(g.getActivity().getId(), g.getActivity().getName()),
                    g.getId(), g.getDays(), g.getMinutes(), false);
            for (ActivityDto a : activites) {
                if (a.getId().equals(dto.getActivity().getId())) {
                    dto.setCurrentDays(a.getDays() == null ? 0 : a.getDays());
                    dto.setCurrentMinutes(a.getMinutes() == null ? 0 : a.getMinutes());
                    dto.setSelected(true);
                    break;
                } else {
                    for (Goal gu : goalsUser) {
                        if (gu.getId().equals(g.getId())) {
                            dto.setSelected(true);
                            break;
                        }
                    }
                }
            }
            if (dto.getCurrentDays() > dto.getDays()) {
                dto.setDays(dto.getCurrentDays());
            }
            if (dto.getCurrentMinutes() > dto.getCurrentMinutes()) {
                dto.setMinutes(dto.getCurrentMinutes());
            }
            goalsDto.add(dto);
        }
        return goalsDto;
    }

    public List<Statistic> getStatistics(Long userId) {
        User user = this.userService.verify(userId);
        return this.userGoalActivityRepository.findStatisticsByUserAndDateRegisterAndWeek(user,
                Dates.getFirstDayOfWeek(Dates.getFirstDayOfMonth()), Dates.getWeekOfMonth());
    }

}
