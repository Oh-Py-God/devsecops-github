package in.ohpygod.devsecops;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class MainApplication {

    @RequestMapping("/")
    String home() {
        return "<h2>Oh Py God!</h2>";
    }

    public static void main(String[] args) {
        SpringApplication.run(MainApplication.class, args);
    }

}
