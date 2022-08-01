package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeatherController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="weather/Weather_view")
	public String Weather_view() {
		
		
		log.info(this.getClass());
		log.info("메인페이지");
		return "/weather/Weather_view";
	}
	
	
}
