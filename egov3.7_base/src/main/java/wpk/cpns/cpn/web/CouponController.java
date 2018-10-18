package wpk.cpns.cpn.web;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import wpk.com.service.ComDefaultVO;
import wpk.cpns.cpn.service.CouponService;
import wpk.cpns.cpn.service.CouponVO;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

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
public class CouponController {
	
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	/** cpnService */
	@Resource(name = "cpnService")
	private CouponService cpnService;
	
	/** EgovPropertyService */
	@Resource(name = "wpkPropertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * 쿠폰/할인키 목록화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/cpns/view/{cpnType}", method=RequestMethod.GET)
	public String getCpnListView(@PathVariable("cpnType") String cpnType, @ModelAttribute("cpnSearchVO") ComDefaultVO cpnSearchVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		//검색조건 유지
		model.addAttribute("searchCond", cpnSearchVO);
		model.addAttribute("cpnType", cpnType);
		
		return cpnType.equals(propertiesService.getString("cpnTypeCoupon"))? "wpk/cpns/cpn/CpnList": "wpk/cpns/cpn/DcKeyList";
	}
	
	/**
	 * 쿠폰/할인키 목록 조회
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/cpns", method = RequestMethod.GET)
	public ModelAndView getCpnList(@ModelAttribute("cpnSearchVO") ComDefaultVO cpnSearchVO, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			//@Todo 에러처리
			return modelAndView;
		}
		
		List<CouponVO> cpnList = cpnService.selectCpnList(cpnSearchVO);
		int totalCnt = cpnService.selectCpnListTotalCnt(cpnSearchVO);
		
		modelAndView.addObject("draw", cpnSearchVO.getDraw());
		modelAndView.addObject("recordsTotal", totalCnt);
		modelAndView.addObject("recordsFiltered", totalCnt);
		modelAndView.addObject("cpnList", cpnList);
		
		return modelAndView;
	}
	
	/**
	 * 쿠폰 상세화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/cpns/{cpnSeq}", method=RequestMethod.GET)
	public String getCpnDetailView(@PathVariable("cpnSeq") String cpnSeq, @ModelAttribute("cpnSearchVO") ComDefaultVO cpnSearchVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		CouponVO cpnVO = cpnService.selectCpn(cpnSeq);
		model.addAttribute("cpnVO", cpnVO);
		model.addAttribute("cpnType", cpnSearchVO.getCpnType());
		
		return cpnSearchVO.getCpnType().equals(propertiesService.getString("cpnTypeCoupon"))? "wpk/cpns/cpn/CpnDetail": "wpk/cpns/cpn/DcKeyDetail";
	}
	
	/**
	 * 쿠폰 정보변경
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/cpns/{cpnSeq}", method=RequestMethod.PUT)
	public ModelAndView updateCpnDetail(@PathVariable("cpnSeq") String cpnSeq, @RequestBody CouponVO cpnVO, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return modelAndView;
		}
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		cpnVO.setUpdtId(loginVO.getId());
		cpnVO.setCpnSeq(cpnSeq);
		
		//쿠폰 정보 수정
		cpnService.updateCpn(cpnVO);
		model.addAttribute("retMsg", "common.message.success");
		
		return modelAndView;
	}
	
	/**
	 * 쿠폰 등록화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/cpns/cpn/iview/{cpnType}", method = RequestMethod.GET)
	public String insertCouponView(@PathVariable("cpnType") String cpnType, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		model.addAttribute("cpnType", cpnType);
		
		return cpnType.equals(propertiesService.getString("cpnTypeCoupon"))? "wpk/cpns/cpn/CpnInst": "wpk/cpns/cpn/DcKeyInst";
	}
	
	/**
	 * 쿠폰 정보등록
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/cpns/cpn", method=RequestMethod.POST)
	public ModelAndView insertCpn(@RequestBody CouponVO cpnVO, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return modelAndView;
		}
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		cpnVO.setRegId(loginVO.getId());
		cpnVO.setUpdtId(loginVO.getId());
		
		cpnService.insertCpn(cpnVO);
		model.addAttribute("retMsg", "common.message.success");
		
		return modelAndView;
	}
	
	/**
	 * 쿠폰코드 중복체크
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/cpns/cpn/{cpnCd}", method = RequestMethod.GET)
	public ModelAndView checkCpnCdDuplicate(@PathVariable("cpnCd") String cpnCd, @ModelAttribute("cpnVO") CouponVO cpnVO, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return modelAndView;
		}
		
		cpnVO.setCpnCd(cpnCd);
		int cnt = cpnService.checkCpnCdDuplicate(cpnVO);
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
	 * 주차장별 쿠폰/할인키 목록 조회
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/parks/{parkCd}/cpns", method = RequestMethod.GET)
	public ModelAndView getCpnListByPark(@ModelAttribute("cpnSearchVO") ComDefaultVO cpnSearchVO, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			//@Todo 에러처리
			return modelAndView;
		}
		
		List<CouponVO> cpnList = cpnService.selectCpnListByPark(cpnSearchVO);
		int totalCnt = cpnList.size();
		
		modelAndView.addObject("draw", cpnSearchVO.getDraw());
		modelAndView.addObject("recordsTotal", totalCnt);
		modelAndView.addObject("recordsFiltered", totalCnt);
		modelAndView.addObject("cpnList", cpnList);
		
		return modelAndView;
	}
}
