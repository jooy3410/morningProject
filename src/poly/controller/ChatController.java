package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
 
    /*
     * @GetMapping("/")
     
    public String chat(){
        return "chat";
    }
    */
	
	@RequestMapping(value = "chat/chat", method = RequestMethod.GET)
	public String chat(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		return "/chat/chat";
	}
}
