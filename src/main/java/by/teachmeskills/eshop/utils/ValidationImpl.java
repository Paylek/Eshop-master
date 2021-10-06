package by.teachmeskills.eshop.utils;

import by.teachmeskills.eshop.repository.domain.User;

import java.time.LocalDate;

public class ValidationImpl implements Validation {


    @Override
    public boolean validateData(User user) {

        boolean check = (checkName(user) && checkSurname(user) && checkBirth(user) && checkEmail(user) && checkPass(user));
        return check;
    }

    private boolean checkName(User user) {
        String name = user.getName();
        if (name.isEmpty()) {
            return false;
        } else if (name.matches(".*\\d+.*")) {
            return false;
        }
        return true;
    }

    private boolean checkSurname(User user) {
        String surname = user.getSurname();
        if (surname.isEmpty()) {
            return false;
        } else if (surname.matches(".*\\d+.*")) {
            return false;
        }
        return true;
    }

    private boolean checkEmail(User user) {
        String email = user.getEmail();
        if (email.isEmpty()) {
            return false;
        } else if (!email.matches("^(.+)@(.+)$")) {
            return false;
        }
        return true;
    }

    private boolean checkPass(User user) {
        String pass = user.getPassword();
        if (pass.isEmpty()) {
            return false;
        } else if (!(pass.length() > 3 && pass.length() < 7)) {
            return false;
        } else if (!pass.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{4,6}")) {
            return false;
        }
        return true;
    }

    private boolean checkBirth(User user) {
        LocalDate birthday = user.getDateOfBirthday();
        if (!isWithinRange(birthday)) {
            return false;
        }
        return true;
    }

    static boolean isWithinRange(LocalDate testDate) {
        LocalDate endDate = LocalDate.of(2016, 1, 1);
        LocalDate startDate = LocalDate.of(1949, 12, 31);
        return (testDate.isAfter(startDate) && testDate.isBefore(endDate));
    }

}
