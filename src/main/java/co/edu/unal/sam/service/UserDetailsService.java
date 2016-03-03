package co.edu.unal.sam.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.inject.Inject;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import co.edu.unal.sam.aspect.model.domain.User;
import co.edu.unal.sam.aspect.model.repository.UserRepository;

@Component
public class UserDetailsService
        implements org.springframework.security.core.userdetails.UserDetailsService {

    @Inject
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        final User user = this.userRepository.findByUsername(username);

        if (Objects.isNull(user)) {
            throw new UsernameNotFoundException(
                    String.format("User with the username %s doesn't exist", username));
        }

        // Create a granted authority based on user's role.
        // Can't pass null authorities to user. Hence initialize with an empty arraylist
        List<GrantedAuthority> authorities = new ArrayList<>();
        // TODO agregar roles a usuario según rol
        if (user != null) {
            authorities = AuthorityUtils.createAuthorityList("ROLE_ADMIN");
        }

        // Create a UserDetails object from the data
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(
                user.getUsername(), user.getPassword(), authorities);

        return userDetails;
    }

}
