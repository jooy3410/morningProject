package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.BoardDTO;
import poly.dto.ImgDTO;
import poly.dto.RoutineDTO;
import poly.util.CmmUtil;
import poly.service.IRoutineService;

@Controller
public class RoutineController {
	
private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "RoutineService")
	private IRoutineService routineService;
	
	@RequestMapping(value="routine/time")
	public String time(HttpServletRequest request, ModelMap model, HttpSession session) {
		log.info(this.getClass());
		log.info("메인페이지");
		
		String user_no = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));
		 String user_name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
		log.info("세션으로부터 받아온 회원번호 : " + user_no);
		 log.info("세션으로부터 받아온 닉네임 : " + user_name);
		
		
		return "/routine/time";
	}
	
	
	/**
	 * 시간 입력받기 시작
	 * 
	 */
	@RequestMapping(value="routine/insertRoutineInfo")
	public String insertRoutineInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) 
			throws Exception{
		
		log.info(getClass().getName() + ".insertRoutineInfo start");
		
			
			String user_name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
			
			log.info("세션으로부터 받아온 닉네임 : " + user_name);
		
		
		//루틴입력 결과에 대한 메시지를 전달할 변수
		String msg = "";
		
		String url = "";
		
		//웹에서 받는 정보를 저장할 변수
		RoutineDTO pDTO = null;
		
		/*
		 * ###############################################################
		 * 웹(회원정보 입력화면)에서 받는 정보를 String 변수에 저장 시작!!
		 * 
		 * 무조건 웹으로 받은 정보는 DTO에 저장하기 위해 임시로 String 변수에 저장함
		 * ###############################################################
		 */
		
		String time = CmmUtil.nvl(request.getParameter("time")).toString(); //알람시간
		String content = CmmUtil.nvl(request.getParameter("content"));//루틴이름
		String user_no = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));//회원번호
		
		 
		
		/*
		 * ###############################################################
		 * 웹(회원정보 입력화면)에서 받는 정보를 String 변수에 저장 시작!!
		 * 
		 * 무조건 웹으로 받은 정보는 DTO에 저장하기 위해 임시로 String 변수에 저장함
		 * ###############################################################
		 */
		
		/*
		 * ################################################################
		 * 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야한다.
		 * ################################################################
		 */
		log.info("time : "+ time);
		log.info("content  : " + content );
		log.info("user_no : " + user_no);
		
		/*
		 * ################################################################
		 * 웹(회원정보 입력화면)에서 받은 정보를 DTO에 저장하기 시작!!
		 * 무조건 웹으로 받은 정보는 DTO에 저장해야한다고 이해하길권함
		 * ################################################################
		 *
		 */
		log.info("String저장끝");
		
		log.info("pDTO저장 시작!");
		
		//웹(회원정보 입력화면)에서 받은 정보 저장할 변수를 메모리에 올리기
		pDTO = new RoutineDTO();
		
		
		pDTO.setTime(time);
		pDTO.setContent(content);
		pDTO.setUser_no(user_no);
		
		log.info("res 시작");
		
		// DB에 값이 잘 저장되었다면, 1반환
		
		int res = routineService.insertRoutineInfo(pDTO);
		log.info("res : " + res);
		
		if (res > 0) {
			msg = "루틴 등록 성공!!";
		} else {
			msg = "루틴 등록 실패!!";
		}
		
		url = "/index.do";
		log.info("model.addAttribute");
		model.addAttribute("msg",msg);
		model.addAttribute("usrl", url);
		
		pDTO = null;
		log.info("insertRoutinInfo End");
		
		
		
		return "/redirect";
		
	}
	
	//루틴게시판 에이작스
		@ResponseBody
		@RequestMapping(value="/getMyRoutine")
		public List<RoutineDTO> getMyRoutine(HttpServletRequest request,HttpServletResponse response, ModelMap model,
				HttpSession session) throws Exception {
			log.info("getMyRoutine start!");
			
			String user_no = (String) session.getAttribute("SS_USER_NO");
			log.info("getMyRoutine 받아온 회원번호 : " + user_no);
			
			RoutineDTO pDTO = new RoutineDTO();
			pDTO.setUser_no(user_no);
			
			List<RoutineDTO> rList = routineService.getMyRoutine(pDTO);
			
			for (RoutineDTO i : rList) {
				log.info("for문으로 가져온 rList 값 테스트 : " + i.getSeq());
				log.info("for문으로 가져온 rLidt 값 테스트 : " + i.getContent());
				log.info("for문으로 가져온 rLidt 값 테스트 : " + i.getTime());
				log.info("for문으로 가져온 rLidt 값 테스트 : " + i.getUser_no());
			}
			
			
			log.info("getMyRoutine  End!");
			return rList;
			
			
			
		}
	
	//루틴 상세페이지
	@RequestMapping(value="/routine/routineList")
	public String time(HttpServletRequest request) throws Exception {
		log.info(this.getClass());
		
		return "/routine/routineList";
	}
	
	
	//루틴 상세페이지
	@RequestMapping(value = "routine/routineDetail.do")
	public String routineDetail(HttpServletRequest request,HttpServletResponse response, ModelMap model,
			HttpSession session) throws Exception {
		
		
		log.info(this.getClass().getName() + "RoutineDetail.do start!");
		
		String seq = request.getParameter("no");
		
		RoutineDTO pDTO = new RoutineDTO();
		pDTO.setSeq(seq);
		
		
		RoutineDTO rDTO = routineService.getRoutineDetail(pDTO);
		
		if(rDTO == null) {
			rDTO = new RoutineDTO();
					
		}
		
		model.addAttribute("rDTO", rDTO);
		
		log.info(this.getClass().getName() + "RoutineDetail.do end!");
		
		
		return "/routine/routineDetail";
		
	}
	
	
	
	//루틴 수정
	@RequestMapping(value="routine/doRoutineUpdate")
    public String doRoutineUpdate(HttpServletRequest request, HttpServletResponse response,
                              ModelMap model, HttpSession session) throws Exception {
								
		
		log.info(getClass().getName() + ".doRoutineUpdate start");
		
		String msg = "";
		String url = "";
		
		 try {
		
		String seq = CmmUtil.nvl(request.getParameter("seq"));
		String time = CmmUtil.nvl(request.getParameter("time")).toString(); //알람시간
		String content = CmmUtil.nvl(request.getParameter("content"));//루틴이름
		String user_no = CmmUtil.nvl(request.getParameter("user_no"));
		
		log.info(time);
		log.info(content);
		log.info(seq);
		
		
		
		RoutineDTO pDTO = new RoutineDTO();
		
		pDTO.setSeq(seq);
		pDTO.setTime(time);
		pDTO.setContent(content);
		pDTO.setUser_no(user_no);
		
		routineService.updateRoutine(pDTO);
		
		 msg = "변경 됐습니다.";
		 url = "/user/mypage.do";
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		 } catch(Exception e) {
				log.info("오류 발생 : " + e.toString());
				e.printStackTrace();
				
		 }
	return "/redirect";
}
	
	//수정화면
	@RequestMapping(value="routine/editRoutine")
	public String editRoutine(HttpServletRequest request, HttpServletResponse response,
            ModelMap model, HttpSession session) throws Exception {
		
	
		log.info(getClass().getName() + "editRoutine 시작!");
		
		String seq = request.getParameter("no");
	
		
		RoutineDTO pDTO = new RoutineDTO();
		pDTO.setSeq(seq);
		
		
		RoutineDTO rDTO = routineService.getRoutineDetail(pDTO);
		
		if(rDTO == null) {
			rDTO = new RoutineDTO();
					
		}
		
		model.addAttribute("rDTO", rDTO);
		
		log.info(this.getClass().getName() + "routineDetail.do end!!");
		
		

		return "/routine/editRoutine";
	}
	
	//삭제 로직
	@RequestMapping("routine/routineDelete")
	public String routineDelete(HttpServletRequest request, HttpServletResponse response,
            ModelMap model, HttpSession session) throws Exception {
		
		log.info(getClass().getName() + "routineDelete 시작!");
		
		String msg = "";
		 try {
	            String seq = CmmUtil.nvl(request.getParameter("no")); //글번호

	            RoutineDTO pDTO = new RoutineDTO();
	    		pDTO.setSeq(seq);

	            // 게시글 삭제하기 DB 쿼리 보내기
	            routineService.deleteRoutine(pDTO);

	            msg = "삭제가 완료되었습니다.";

	            pDTO = null;
	            
	        } catch (Exception e) {
	            msg = "실패하였습니다." + e.toString();
	            log.info("삭제 실패! : " + e.toString());
	            e.printStackTrace();

	        } finally {
	            log.info(this.getClass().getName() + ".RoutineDelete.do End!");

	            
	            String url = "/user/mypage.do";
	    		
	    		model.addAttribute("msg", msg);
	    		model.addAttribute("url", url);
	        }

	        return "/redirect";

	    }
	
		
		
	
	
	
	
	
	

}
