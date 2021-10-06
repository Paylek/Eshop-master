package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.repository.domain.User;

import java.time.LocalDate;
import java.util.Date;

public class Check {
    public static void main(String[] args) {
        Check check = new Check();
        System.out.println(check.checkName("Sdde"));
        LocalDate testDate = LocalDate.of(2015, 1, 1);
        System.out.println(check.isWithinRange(testDate));
        String str = "qa@mail.ru";
               System.out.println(str.matches("^(.+)@(.+)$"));

               String pass = "2wsxS";
        System.out.println(pass.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{4,6}"));

    }

    public boolean checkName(String s) {
        if (s.isEmpty()) {
            return false;
        } else if (s.matches(".*\\d+.*")) {
            return false;
        }
        return true;
    }

    boolean isWithinRange(LocalDate testDate) {
        LocalDate endDate = LocalDate.of(2051, 1, 1);
        LocalDate startDate = LocalDate.of(1949, 12, 31);
        return (testDate.isAfter(startDate) && testDate.isBefore(endDate));
    }
}
