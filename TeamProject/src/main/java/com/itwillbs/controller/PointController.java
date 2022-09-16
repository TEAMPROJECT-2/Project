package com.itwillbs.controller;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dao.PointDAO;
import com.itwillbs.dao.PointDAOImpl;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.function.FunctionClass;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.PointService;
import com.itwillbs.service.PointServiceImpl;
import com.siot.IamportRestClient.IamportClient;


@Controller
public class PointController {
//	@ResponseBody
//	@RequestMapping(value = "/verify_iamport/{imp_uid}", method = RequestMethod.POST)
//	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
//	    return client.paymentByImpUid(imp_uid);
//	}
	
	@Inject
	private PointService pointService;
	
	private PointDAO pointDAO; 
	
	@Inject
	private MemberService memberService;
	
	private IamportClient api;
	public PointController() {
	      // REST API 키와 REST API secret 입력
	      this.api = new IamportClient("6077548071335284", "dCktE2HC7a2YUwzkDWeeqfuZvZdDen3Sm66vMQja5xQTpoAsMz9YUPZ42kuSyxReMbEXbvtEvOjllVjQ");
	}   
	
	@RequestMapping(value = "/point/charge", method = RequestMethod.GET)
	public String charge(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		if(userId==null) {
			return "/member/msg";
		} else {
		PointDTO pointDTO = pointService.getMember(userId);	
		MemberDTO memberDTO = memberService.getMember(userId); 
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("pointDTO", pointDTO);
		return "point/charge";
		}
	}
	 @ResponseBody
	   @RequestMapping(value="/point/insertChargePoint", method = RequestMethod.POST)
	   public String paymenByImpUid (@RequestParam Map<String, Object> para){
	      
	      Map<String, Object> sMap = para;

	      sMap.put("pointDate", new FunctionClass().nowTime("yyyy-MM-dd HH:mm:ss"));
	      System.out.println(sMap);
	      pointService.insertChargePoint(sMap);
	      
	      return "redirect:/main/main";
	 }

//	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
//	Date time = new Date();
//	String time1 = format1.format(time.getTime());


	
	
}
