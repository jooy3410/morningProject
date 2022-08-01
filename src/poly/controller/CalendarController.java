package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class CalendarController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="calendar/Calendar_view")
	public String Calendar_view() {
		
		
		log.info(this.getClass());
		log.info("켈린더페이지");
		return "/calendar/Calendar_view";
	}

}
