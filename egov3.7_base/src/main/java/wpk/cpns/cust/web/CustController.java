package wpk.cpns.cust.web;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sec.ram.service.AuthorManageVO;
import egovframework.com.sec.ram.service.EgovAuthorManageService;
import egovframework.com.sec.rgm.service.AuthorGroup;
import egovframework.com.sec.rgm.service.AuthorGroupVO;
import egovframework.com.sec.rgm.service.EgovAuthorGroupService;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import wpk.com.service.ComDefaultVO;
import wpk.com.service.ParkMasterVO;
import wpk.com.service.WpkComUtilService;
import wpk.com.util.WpkCommonUtil;
import wpk.cpns.cpn.service.CouponService;
import wpk.cpns.cust.service.CustCouponVO;
import wpk.cpns.cust.service.CustService;
import wpk.cpns.cust.service.CustVO;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 입주사 관리 controller 클래스를 정의한다.
 * @author jeremy.hong
 * @since 2018.07.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 * 수정일      수정자      수정내용
 * ----------  --------    ---------------------------
 * 2018.07.01  jeremy      최초 생성
 * </pre>
 */

@Controller
@SessionAttributes(types=SessionVO.class)
public class CustController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustController.class);
	
//	@Resource(name="egovMessageSource")
//	EgovMessageSource egovMessageSource;
	
	/** custService */
	@Resource(name = "custService")
	private CustService custService;
	
	/** cpnService */
	@Resource(name = "cpnService")
	private CouponService cpnService;
	
//	/** cmmUseService */
//	@Resource(name = "EgovCmmUseService")
//	private EgovCmmUseService cmmUseService;
	
	/** EgovPropertyService */
	@Resource(name = "wpkPropertiesService")
	protected EgovPropertyService propertiesService;
	
//	/** DefaultBeanValidator beanValidator */
//	@Autowired
//	private DefaultBeanValidator beanValidator;
	
	/**
	 * 입주사 목록화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs/view", method=RequestMethod.GET)
	public String getCustListView(@ModelAttribute("custSearchVO") ComDefaultVO custSearchVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		//검색조건 유지
		model.addAttribute("searchCond", custSearchVO);
		
		return "wpk/cpns/cust/CustList";
	}
	
	/**
	 * 입주사 목록 조회
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs", method = RequestMethod.GET)
	public ModelAndView getCustList(@ModelAttribute("custSearchVO") ComDefaultVO custSearchVO, ModelMap model) throws Exception {
		
		
		
//		Enumeration paramNames = request.getParameterNames();
//		while(paramNames.hasMoreElements()) {
//			String paramName = (String)paramNames.nextElement();
//			
//			System.out.println("Header : " + paramName); 
//			
//			String[] paramValues = request.getParameterValues(paramName);
//			
//			if (paramValues.length == 1) {
//				String paramValue = paramValues[0];
//				if (paramValue.length() == 0)
//					System.out.println("Value : No Value");
//				else
//					System.out.println(paramValue);
//			} else {
//				for(int i=0; i<paramValues.length; i++) {
//					System.out.println("Value : " + paramValues[i]);
//				}
//			}
//		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			//@Todo 에러처리
			return modelAndView;
		}
		
		List<CustVO> custList = custService.selectCustList(custSearchVO);
		int totalCnt = custService.selectCustListTotalCnt(custSearchVO);
		
		modelAndView.addObject("draw", custSearchVO.getDraw());
		modelAndView.addObject("recordsTotal", totalCnt);
		modelAndView.addObject("recordsFiltered", totalCnt);
		modelAndView.addObject("custList", custList);
		
		return modelAndView;
	}
	
	/**
	 * 입주사 상세화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs/{custSeq}", method=RequestMethod.GET)
	public String getCustDetailView(@PathVariable("custSeq") String custSeq, @ModelAttribute("custSearchVO") ComDefaultVO custSearchVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		CustVO custVO = custService.selectCust(custSeq);
		model.addAttribute("custVO", custVO);
		
		return "wpk/cpns/cust/CustDetail";
	}
	
	/**
	 * 입주사 정보변경
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs/{custSeq}", method=RequestMethod.PUT)
	public ModelAndView updateCustDetail(@PathVariable("custSeq") String custSeq, @RequestBody CustVO custVO, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return modelAndView;
		}
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		custVO.setUpdtId(loginVO.getId());
		custVO.setCustSeq(custSeq);
		
		//비밀번호 초기화
		if (Boolean.valueOf(custVO.getIsReset())) {
			custService.updatePassword(custVO);
			model.addAttribute("retMsg", "common.message.success");
		}
		//입주사 정보 수정
		else {
			custService.updateCust(custVO);
			model.addAttribute("retMsg", "common.message.success");
		}
		
		return modelAndView;
	}
	
	/**
	 * 입주사 등록화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs/cust", method = RequestMethod.GET)
	public String insertCustView() throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		return "wpk/cpns/cust/CustInst";
	}
	
	/**
	 * 입주사 정보등록
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs/cust", method=RequestMethod.POST)
	public ModelAndView insertCust(@RequestBody CustVO custVO, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return modelAndView;
		}
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		custVO.setRegId(loginVO.getId());
		custVO.setUpdtId(loginVO.getId());
		
		custService.insertCust(custVO);
		model.addAttribute("retMsg", "common.message.success");
		
		return modelAndView;
	}
	
	/**
	 * 아이디 중복체크
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs/cust/{id}", method = RequestMethod.GET)
	public ModelAndView checkIdDuplicate(@PathVariable("id") String id, @ModelAttribute("custVO") CustVO custVO, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return modelAndView;
		}
		
		custVO.setCustId(id);
		int cnt = custService.checkIdDuplicate(custVO);
		if (cnt > 0) {
			model.addAttribute("retMsg", "common.message.success");
			model.addAttribute("checkResult", false);
		}
		else {
			model.addAttribute("retMsg", "common.message.success");
			model.addAttribute("checkResult", true);
		}
		
		return modelAndView;
	}
	
	/**
	 * 입주사 쿠폰설정 화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs/{custSeq}/cpns/view", method=RequestMethod.GET)
	public String getCustCouponView(@PathVariable("custSeq") String custSeq, @ModelAttribute("custSearchVO") ComDefaultVO custSearchVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		CustVO custVO = custService.selectCust(custSeq);
		model.addAttribute("custVO", custVO);
		model.addAttribute("cpnTypeCoupon", propertiesService.getString("cpnTypeCoupon"));
		model.addAttribute("cpnTypeDcKey", propertiesService.getString("cpnTypeDcKey"));
		
		return "wpk/cpns/cust/CustCoupon";
	}
	
	/**
	 * 입주사 쿠폰 목록 조회
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs/{custSeq}/cpns", method = RequestMethod.GET)
	public ModelAndView getCustCpnList(@PathVariable("custSeq") String custSeq, @ModelAttribute("custSearchVO") ComDefaultVO custSearchVO, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			//@Todo 에러처리
			return modelAndView;
		}
		
		CustCouponVO custCpnVO = new CustCouponVO();
		custCpnVO.setCustSeq(custSeq);
		custCpnVO.setCpnType(custSearchVO.getCpnType());
		
		List<CustCouponVO> custCpnList = cpnService.selectCustCouponList(custCpnVO);
		int totalCnt = custCpnList.size();
		
		modelAndView.addObject("draw", custSearchVO.getDraw());
		modelAndView.addObject("recordsTotal", totalCnt);
		modelAndView.addObject("recordsFiltered", totalCnt);
		modelAndView.addObject("custCpnList", custCpnList);
		
		return modelAndView;
	}
	
	/**
	 * 입주사 쿠폰 정보 저장
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/custs/{custSeq}/cpns", method = RequestMethod.POST)
	public ModelAndView insertCustCpn(@PathVariable("custSeq") String custSeq, @ModelAttribute("park") String parkCd, @RequestBody CustCouponVO[] custCpnList, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return modelAndView;
		}
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		CustVO custVO = new CustVO();
		custVO.setParkCd(parkCd);
		custVO.setCustSeq(custSeq);
		custVO.setRegId(loginVO.getId());
		custVO.setUpdtId(loginVO.getId());
		custVO.setCustCpnList(custCpnList);
		
		cpnService.insertCustCpn(custVO);
		model.addAttribute("retMsg", "common.message.success");
		
		return modelAndView;
	}
	
	/**
	 * 그룹별 할당된 권한 목록 조회
	 * @param authorGroupVO AuthorGroupVO
	 * @param authorManageVO AuthorManageVO
	 * @return String
	 * @exception Exception
	 */
//	@IncludedInfo(name="권한그룹관리Test", listUrl="/cpns/cust/EgovAuthorGroupList.do", order = 71,gid = 20)
//	@RequestMapping(value="/cpns/cust/EgovAuthorGroupList.do")
//	public String selectAuthorGroupListCpns(@ModelAttribute("authorGroupVO") AuthorGroupVO authorGroupVO,
//			                            @ModelAttribute("authorManageVO") AuthorManageVO authorManageVO,
//			                             ModelMap model) throws Exception {
//		
//		/** paging */
//		PaginationInfo paginationInfo = new PaginationInfo();
//		paginationInfo.setCurrentPageNo(authorGroupVO.getPageIndex());
//		paginationInfo.setRecordCountPerPage(authorGroupVO.getPageUnit());
//		paginationInfo.setPageSize(authorGroupVO.getPageSize());
//		
//		authorGroupVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
//		authorGroupVO.setLastIndex(paginationInfo.getLastRecordIndex());
//		authorGroupVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
//		
//		authorGroupVO.setAuthorGroupList(egovAuthorGroupService.selectAuthorGroupList(authorGroupVO));
//		model.addAttribute("authorGroupList", authorGroupVO.getAuthorGroupList());
//		
//		int totCnt = egovAuthorGroupService.selectAuthorGroupListTotCnt(authorGroupVO);
//		paginationInfo.setTotalRecordCount(totCnt);
//		model.addAttribute("paginationInfo", paginationInfo);
//		
//		authorManageVO.setAuthorManageList(egovAuthorManageService.selectAuthorAllList(authorManageVO));
//		model.addAttribute("authorManageList", authorManageVO.getAuthorManageList());
//		
//		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
//		
//		return "wpk/cpns/cust/EgovAuthorGroupManage";
//	}
	
	/**
	 * 그룹에 권한정보를 할당하여 데이터베이스에 등록
	 * @param userIds String
	 * @param authorCodes String
	 * @param regYns String
	 * @param authorGroup AuthorGroup
	 * @return String
	 * @exception Exception
	 */
//	@RequestMapping(value="/cpns/cust/EgovAuthorGroupInsert.do")
//	public String insertAuthorGroupCpns(@RequestParam("userIds") String userIds,
//			                        @RequestParam("authorCodes") String authorCodes,
//			                        @RequestParam("regYns") String regYns,
//			                        @RequestParam("mberTyCodes") String mberTyCodes,// 2011.08.04 수정 부분
//			                        @ModelAttribute("authorGroup") AuthorGroup authorGroup,
//			                         ModelMap model) throws Exception {
//		
//		String [] strUserIds = userIds.split(";");
//		String [] strAuthorCodes = authorCodes.split(";");
//		String [] strRegYns = regYns.split(";");
//		String [] strMberTyCodes = mberTyCodes.split(";");// 2011.08.04 수정 부분
//		
//		for(int i=0; i<strUserIds.length;i++) {
//			authorGroup.setUniqId(strUserIds[i]);
//			authorGroup.setAuthorCode(strAuthorCodes[i]);
//			authorGroup.setMberTyCode(strMberTyCodes[i]);// 2011.08.04 수정 부분
//			if(strRegYns[i].equals("N"))
//			    egovAuthorGroupService.insertAuthorGroup(authorGroup);
//			else 
//			    egovAuthorGroupService.updateAuthorGroup(authorGroup);
//		}
//		
//		model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));		
//		return "forward:/cpns/cust/EgovAuthorGroupListCpns.do";
//	}
	
	/**
	 * 그룹별 할당된 시스템 메뉴 접근권한을 삭제
	 * @param userIds String
	 * @param authorGroup AuthorGroup
	 * @return String
	 * @exception Exception
	 */ 
//	@RequestMapping(value="/cpns/cust/EgovAuthorGroupDelete.do")
//	public String deleteAuthorGroupCpns(@RequestParam("userIds") String userIds,
//		                            @ModelAttribute("authorGroup") AuthorGroup authorGroup,
//		                            ModelMap model) throws Exception {
//		
//		String [] strUserIds = userIds.split(";");
//		for(int i=0; i<strUserIds.length;i++) {
//			authorGroup.setUniqId(strUserIds[i]);
//			egovAuthorGroupService.deleteAuthorGroup(authorGroup);
//		}
//		
//		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
//		return "forward:/cpns/cust/EgovAuthorGroupListCpns.do";
//	}

}
