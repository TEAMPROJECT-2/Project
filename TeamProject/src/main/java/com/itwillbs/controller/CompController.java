package com.itwillbs.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;
import com.itwillbs.service.CompService;
import com.itwillbs.service.MemberService;

@Controller
public class CompController {

	@Inject
	private CompService compService;
	@Resource(name = "compUploadPath")
	private String compUploadPath;

	@RequestMapping(value = "/comp/compMain", method = RequestMethod.GET)
	public String compAdinMain() {
		return "comp/compMain";
	}
	@RequestMapping(value = "/comp/updateProd", method = RequestMethod.GET)
	public String compUpdateProd() {
		return "comp/updateProd";
	}
	@RequestMapping(value = "/comp/insertGoods", method = RequestMethod.GET)
	public String compInsertProd() {
		System.out.println("comp/insertGoods");
		return "comp/insertGoods";
	}





	@RequestMapping(value = "/comp/insertGoodsPro", method = RequestMethod.POST)
	public String insertPro(HttpServletRequest request,HttpSession session,MultipartFile prodLMainImg,MultipartFile prodLSubImg) throws Exception {
//		ProdDTO prodDTO,
		// 로그인후 세션값, 업체 아이디 갖고옴
		System.out.println("insertPro");
		String CompNm = (String)session.getAttribute("compId");
		ProdDTO prodDTO = new ProdDTO();
		prodDTO.setProdLCompNm(CompNm);
//
		//파일 이름  => 랜덤문자_파일이름

		UUID uuid=UUID.randomUUID();

		String MainImg=uuid.toString()+"_"+prodLMainImg.getOriginalFilename();
		String SubImg=uuid.toString()+"_"+prodLSubImg.getOriginalFilename();

		//업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
		File uploadMainFile=new File(compUploadPath, MainImg);
		File uploadSubFile=new File(compUploadPath,SubImg);

		FileCopyUtils.copy(prodLMainImg.getBytes(), uploadMainFile);
		FileCopyUtils.copy(prodLSubImg.getBytes(), uploadSubFile);

		prodDTO.setProdLCode(request.getParameter("prodLCode"));
		prodDTO.setProdLType(request.getParameter("default-radio-1"));
		prodDTO.setProdLOption1(request.getParameter("prodLOption1"));
		prodDTO.setProdLOption2(request.getParameter("prodLOption2"));
		prodDTO.setProdLProdNm(request.getParameter("prodLProdNm"));
		prodDTO.setProdLPrice(Integer.parseInt(request.getParameter("prodLPrice")));
		prodDTO.setProdLDetail(request.getParameter("ProdLDetail"));
		prodDTO.setProdLQuantity(Integer.parseInt(request.getParameter("prodLQuantity")));




		prodDTO.setProdLSubImg(SubImg);
		prodDTO.setProdLMainImg(MainImg);
//		prodDTO.setProdLSubImg(SubImg);
		Map<String, Object> opMap = new HashMap<String, Object>();
		Map<String,Object> op1Map ;

		 List<Map<String,Object>> opList = new ArrayList<Map<String,Object>>();


		 op1Map = new HashMap<String, Object>();
		 op1Map.put("prodLOptionKey",request.getParameter("prodLOption1"));
		 op1Map.put("prodOptionNmKey",request.getParameter("prodOptionNm1"));
		 opList.add(op1Map);

		 op1Map = new HashMap<String, Object>();
		 op1Map.put("prodLOptionKey",request.getParameter("prodLOption2"));
		 op1Map.put("prodOptionNmKey",request.getParameter("prodOptionNm2") );
		 opList.add(op1Map);


		 opMap.put("opList",opList);




		compService.insertProd(prodDTO,opMap);
//		System.out.println(prodDTO);
		// 주소변경 이동
		return "redirect:/comp/insertGoods";
	}
	//업로드 경로 servlet-context.mxl upload폴더 경로 이름













	@RequestMapping(value = "/comp/deleteProd", method = RequestMethod.GET)
	public String compDeleteProd() {
		return "comp/deleteProd";
	}

	@RequestMapping(value = "/comp/prodRefund", method = RequestMethod.GET)
	public String compProdRefund() {
		return "comp/prodRefund";
	}
	@RequestMapping(value = "/comp/updateAccount", method = RequestMethod.GET)
	public String compupdateAccount() {
		return "comp/updateAccount";
	}
	@RequestMapping(value = "/comp/prodList", method = RequestMethod.GET)
	public String compProdList() {
		return "comp/prodList";
	}
	@RequestMapping(value = "/comp/ordList", method = RequestMethod.GET)
	public String compOrdList() {
		return "comp/ordList";
	}

}
