package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="index")
	public String Index() {
		log.info(this.getClass());
		log.info("메인페이지");
		return "/index";
	}
	
	@RequestMapping(value="img/scroll")
	public String scroll() {
		log.info(this.getClass());
		log.info("메인페이지");
		return "/img/scroll";
	}

			
}
