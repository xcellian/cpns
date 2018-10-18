package wpk.cpns.order.web;

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
import wpk.cpns.cpn.service.CouponVO;
import wpk.cpns.cust.service.CustCouponVO;
import wpk.cpns.cust.service.CustService;
import wpk.cpns.cust.service.CustVO;
import wpk.cpns.order.service.OrderDetailVO;
import wpk.cpns.order.service.OrderService;
import wpk.cpns.order.service.OrderVO;
import wpk.cpns.order.service.PayVO;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import org.springframework.web.bind.annotation.CrossOrigin;
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
import com.fasterxml.jackson.core.type.TypeReference;
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
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
//	@Resource(name="egovMessageSource")
//	EgovMessageSource egovMessageSource;
	
	/** orderService */
	@Resource(name = "orderService")
	private OrderService orderService;
	
	/** cpnService */
	@Resource(name = "cpnService")
	private CouponService cpnService;
	
	/** WpkComUtilService */
	@Resource(name = "wpkComUtilService")
	private WpkComUtilService wpkComUtilService;
	
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
	 * 구매목록 화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/orders/view", method=RequestMethod.GET)
	public String getOrderListView(@ModelAttribute("orderSearchVO") ComDefaultVO orderSearchVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		//검색조건 유지
		model.addAttribute("searchCond", orderSearchVO);
		
		return "wpk/cpns/order/OrderList";
	}
	
	/**
	 * 주문 목록 조회
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/orders", method = RequestMethod.GET)
	public ModelAndView getOrderList(@ModelAttribute("orderSearchVO") ComDefaultVO orderSearchVO, ModelMap model) throws Exception {
		
		
		
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
		
		//로그인 정보 취득
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		orderSearchVO.setCustSeq(loginVO.getUniqId());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			//@Todo 에러처리
			return modelAndView;
		}
		
		List<OrderVO> orderList = orderService.selectOrderList(orderSearchVO);
		int totalCnt = orderService.selectOrderListTotalCnt(orderSearchVO);
		
		modelAndView.addObject("draw", orderSearchVO.getDraw());
		modelAndView.addObject("recordsTotal", totalCnt);
		modelAndView.addObject("recordsFiltered", totalCnt);
		modelAndView.addObject("custList", orderList);
		
		return modelAndView;
	}
	
	/**
	 * 주문 상세화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/orders/{orderSeq}", method=RequestMethod.GET)
	public String getOrderDetailView(@PathVariable("orderSeq") String orderSeq, @ModelAttribute("orderSearchVO") ComDefaultVO orderSearchVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		PayVO orderVO = (PayVO) orderService.selectOrder(orderSeq);
		//주문상태
		orderVO.setOrderStateNm(propertiesService.getString("stateNm_" + orderVO.getOrderState()));
		
		model.addAttribute("orderVO", orderVO);
		
		return "wpk/cpns/order/OrderDetail";
	}
	
	/**
	 * 주문화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/order", method=RequestMethod.GET)
	public String getOrderReqView(ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		//로그인 정보 취득
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		//쿠폰 리스트 취득
		CustCouponVO custCpnVO = new CustCouponVO();
		custCpnVO.setCustSeq(loginVO.getUniqId());
		//custCpnVO.setCpnType(custSearchVO.getCpnType());
		custCpnVO.setCpnType("CT010");
		
		ObjectMapper mapper = new ObjectMapper();
		List<CustCouponVO> custCpnList = cpnService.selectCustCouponList(custCpnVO);
		model.addAttribute("custCpnList", mapper.writeValueAsString(custCpnList));
		model.addAttribute("cpnType", custCpnVO.getCpnType());
		
		
		OrderVO orderVO = new OrderVO();
		orderVO.setbDBProc("false");
		model.addAttribute("orderVO", orderVO);
		
		return "wpk/cpns/order/OrderReq";
//		return "wpk/cpns/order/OrderConfirm";
//		return "wpk/cpns/order/OrderResult";
	}
	
	/**
	 * 결제화면 이동
	 * @return ModelAndView
	 * @exception Exception
	 */
	@CrossOrigin
	@RequestMapping(value = "/cpns/order/cnfrm/{cpnType}", method=RequestMethod.POST)
	public String orderReq(@PathVariable("cpnType") String cpnType, @ModelAttribute OrderVO orderVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			//@Todo 에러처리
			return "index";
		}
		
		//로그인 정보 취득
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		//상품명 설정
		String productName = propertiesService.getString("productName_" + cpnType);
		String prodDetail = "";
		
		//입력체크
		List<OrderDetailVO> detailList = orderVO.getOrderDetail();
		//리스트 정렬
		Collections.sort(detailList, new CpnListSort());
		
		int total = 0;
		for (int i = 0; i < detailList.size(); i++) {
			OrderDetailVO detail = detailList.get(i);
			
			if (Integer.parseInt(detail.getQty()) <= 0) {
				// TODO 에러처리
				return "index";
			}
			
			//쿠폰정보 취득
			CustCouponVO searchVO = new CustCouponVO();
			searchVO.setCustSeq(loginVO.getUniqId());
			searchVO.setCpnSeq(detail.getCpnSeq());
			
			CustCouponVO custCpnVO = cpnService.selectCustCpn(searchVO);
			
			detail.setPrice(String.valueOf(custCpnVO.getPrice()));
			detail.setAmount(String.valueOf(Integer.parseInt(detail.getQty()) * custCpnVO.getPrice()));
			total += Integer.parseInt(detail.getAmount());
			
			if (i == 0) {
				prodDetail = custCpnVO.getCpnNm();
			}
		}
		orderVO.setOrderAmount(String.valueOf(total));
		
		productName += (" [" + prodDetail);
		
		if (detailList.size()> 1) {
			productName += (" 외 " + (detailList.size() - 1) + "건");
		}
		productName += "]";
		orderVO.setProductNm(productName);
		
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("orderDetail", mapper.writeValueAsString(detailList));
		
		model.addAttribute("orderVO", orderVO);
		model.addAttribute("loginVO", loginVO);
		model.addAttribute("cpnType", cpnType);
		model.addAttribute("prefixOrderNo", propertiesService.getString("prefixOrderNo"));
		
		//easypay 인증 요청 데이터
		model.addAttribute("EP_mall_id_dev", propertiesService.getString("EP_mall_id_dev"));
		model.addAttribute("EP_mall_id_prod", propertiesService.getString("EP_mall_id_prod"));
		model.addAttribute("EP_mall_nm", propertiesService.getString("EP_mall_nm"));
		model.addAttribute("EP_currency", propertiesService.getString("EP_currency"));
		model.addAttribute("EP_return_url_dev", propertiesService.getString("EP_return_url_dev"));
		model.addAttribute("EP_return_url_prod", propertiesService.getString("EP_return_url_prod"));
		model.addAttribute("EP_ci_url", propertiesService.getString("EP_ci_url"));
		model.addAttribute("EP_charset", propertiesService.getString("EP_charset"));
		model.addAttribute("EP_window_type", propertiesService.getString("EP_window_type"));
		model.addAttribute("EP_os_cert_flag", propertiesService.getString("EP_os_cert_flag"));
		model.addAttribute("EP_kmotion_useyn", propertiesService.getString("EP_kmotion_useyn"));
		model.addAttribute("EP_vacct_end_time", propertiesService.getString("EP_vacct_end_time"));
		
		return "wpk/cpns/order/OrderConfirm";
	}
	
	/**
	 * 주문결과화면 이동
	 * @return ModelAndView
	 * @exception Exception
	 */
	@RequestMapping(value = "/cpns/order/payment", method=RequestMethod.POST)
	public String orderResult(HttpServletRequest request, @RequestParam("orderDetailJSON") String orderDetailJSON, @ModelAttribute PayVO payVO, ModelMap model) throws Exception {
		
		Enumeration paramNames = request.getParameterNames();
		while(paramNames.hasMoreElements()) {
			String paramName = (String)paramNames.nextElement();
			
			System.out.print("Header : " + paramName); 
			
			String[] paramValues = request.getParameterValues(paramName);
			
			if (paramValues.length == 1) {
				String paramValue = paramValues[0];
				if (paramValue.length() == 0)
					System.out.println(" : []");
				else
					System.out.println(" : [" + paramValue + "]");
			} else {
				for(int i=0; i<paramValues.length; i++) {
					System.out.println(" : [" + paramValues[i] + "]");
				}
			}
		}
		
		
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			//@Todo 에러처리
			return "index";
		}
		
		ObjectMapper mapper = new ObjectMapper();
		payVO.setOrderDetail(mapper.readValue(orderDetailJSON, new TypeReference<List<OrderDetailVO>>(){}));
		payVO.setOrderSeq(payVO.getOrder_no());
		
		//로그인 정보 취득
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		//주차장 정보 취득
		ParkMasterVO parkVO = new ParkMasterVO();
		parkVO.setParkCd(loginVO.getUserSe());
		parkVO = wpkComUtilService.selectPark(parkVO);
		
		payVO.setRegId(loginVO.getUserId());
		payVO.setUpdtId(loginVO.getUserId());
		payVO.setCustSeq(loginVO.getUniqId());
		payVO.setCustNm(loginVO.getName());
		payVO.setParkCd(loginVO.getUserSe());
		payVO.setParkNm(parkVO.getParkNm());
		
		//주문상태
		String stateCd = "";
		if ("22".equals(payVO.getPay_type())) {
			stateCd = propertiesService.getString("stateCd_wait");
		}
		else {
			stateCd = propertiesService.getString("stateCd_pay");
		}
		payVO.setOrderState(stateCd);
		payVO.setOrderStateNm(propertiesService.getString("stateNm_" + stateCd));
		
		//결제방법
		String patTypeNm = propertiesService.getString("PayType_" + payVO.getPay_type());
		payVO.setPayType(payVO.getPay_type());
		payVO.setPayTypeNm(patTypeNm);
		payVO.setPay_type_nm(patTypeNm);
		
		if (!"0000".equals(payVO.getRes_cd())) {
			payVO.setOrderState(propertiesService.getString("stateCd_fail"));
		}
		
		//주문정보 등록
		try {
			orderService.insertOrder(payVO);
			payVO.setbDBProc("true");
		} catch (Exception e) {
			logger.error("주문정보 등록 실패");
			e.printStackTrace();
			// TODO: handle exception
			payVO.setbDBProc("false");
			payVO.setOrderState(propertiesService.getString("stateCd_fail"));
			payVO.setOrderStateNm(propertiesService.getString("stateNm_" + payVO.getOrderState()));
		}
		
		model.addAttribute("payVO", payVO);
		model.addAttribute("EP_mall_id_dev", propertiesService.getString("EP_mall_id_dev"));
		model.addAttribute("EP_mall_id_prod", propertiesService.getString("EP_mall_id_prod"));
		
		return "wpk/cpns/order/OrderResult";
	}
	
	/**
	 * Coupon Seq 오름차순 정렬
	 */
	static class CpnListSort implements Comparator<OrderDetailVO>{
		
		@Override
		public int compare(OrderDetailVO o1, OrderDetailVO o2) {
			return o1.getCpnSeq().compareTo(o2.getCpnSeq());
		}
	}
	
	
	
	/**
	 * 입주사 상세화면 이동
	 * @return String
	 * @exception Exception
	 */
//	@RequestMapping(value = "/cpns/custs/{custSeq}", method=RequestMethod.GET)
//	public String getCustDetailView(@PathVariable("custSeq") String custSeq, @ModelAttribute("custSearchVO") ComDefaultVO custSearchVO, ModelMap model) throws Exception {
//		
//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			return "index";
//		}
//		
//		CustVO custVO = custService.selectCust(custSeq);
//		model.addAttribute("custVO", custVO);
//		
//		return "wpk/cpns/cust/CustDetail";
//	}
	
	/**
	 * 입주사 정보변경
	 * @return ModelAndView
	 * @exception Exception
	 */
//	@RequestMapping(value = "/cpns/custs/{custSeq}", method=RequestMethod.PUT)
//	public ModelAndView updateCustDetail(@PathVariable("custSeq") String custSeq, @RequestBody CustVO custVO, ModelMap model) throws Exception {
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("jsonView");
//		
//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			return modelAndView;
//		}
//		
//		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
//		custVO.setUpdtId(loginVO.getId());
//		custVO.setCustSeq(custSeq);
//		
//		//비밀번호 초기화
//		if (Boolean.valueOf(custVO.getIsReset())) {
//			custService.updatePassword(custVO);
//			model.addAttribute("retMsg", "common.message.success");
//		}
//		//입주사 정보 수정
//		else {
//			custService.updateCust(custVO);
//			model.addAttribute("retMsg", "common.message.success");
//		}
//		
//		return modelAndView;
//	}
	
	/**
	 * 입주사 등록화면 이동
	 * @return String
	 * @exception Exception
	 */
//	@RequestMapping(value = "/cpns/custs/cust", method = RequestMethod.GET)
//	public String insertCustView() throws Exception {
//		
//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			return "index";
//		}
//		
//		return "wpk/cpns/cust/CustInst";
//	}
	
	/**
	 * 입주사 정보등록
	 * @return ModelAndView
	 * @exception Exception
	 */
//	@RequestMapping(value = "/cpns/custs/cust", method=RequestMethod.POST)
//	public ModelAndView insertCust(@RequestBody CustVO custVO, ModelMap model) throws Exception {
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("jsonView");
//		
//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			return modelAndView;
//		}
//		
//		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
//		custVO.setRegId(loginVO.getId());
//		custVO.setUpdtId(loginVO.getId());
//		
//		custService.insertCust(custVO);
//		model.addAttribute("retMsg", "common.message.success");
//		
//		return modelAndView;
//	}
	
	/**
	 * 아이디 중복체크
	 * @return ModelAndView
	 * @exception Exception
	 */
//	@RequestMapping(value = "/cpns/custs/cust/{id}", method = RequestMethod.GET)
//	public ModelAndView checkIdDuplicate(@PathVariable("id") String id, @ModelAttribute("custVO") CustVO custVO, ModelMap model) throws Exception {
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("jsonView");
//		
//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			return modelAndView;
//		}
//		
//		custVO.setCustId(id);
//		int cnt = custService.checkIdDuplicate(custVO);
//		if (cnt > 0) {
//			model.addAttribute("retMsg", "common.message.success");
//			model.addAttribute("checkResult", false);
//		}
//		else {
//			model.addAttribute("retMsg", "common.message.success");
//			model.addAttribute("checkResult", true);
//		}
//		
//		return modelAndView;
//	}
	
	/**
	 * 입주사 쿠폰설정 화면 이동
	 * @return String
	 * @exception Exception
	 */
//	@RequestMapping(value = "/cpns/custs/{custSeq}/cpns/view", method=RequestMethod.GET)
//	public String getCustCouponView(@PathVariable("custSeq") String custSeq, @ModelAttribute("custSearchVO") ComDefaultVO custSearchVO, ModelMap model) throws Exception {
//		
//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			return "index";
//		}
//		
//		CustVO custVO = custService.selectCust(custSeq);
//		model.addAttribute("custVO", custVO);
//		model.addAttribute("cpnTypeCoupon", propertiesService.getString("cpnTypeCoupon"));
//		model.addAttribute("cpnTypeDcKey", propertiesService.getString("cpnTypeDcKey"));
//		
//		return "wpk/cpns/cust/CustCoupon";
//	}
	
	/**
	 * 입주사 쿠폰 목록 조회
	 * @return ModelAndView
	 * @exception Exception
	 */
//	@RequestMapping(value = "/cpns/custs/{custSeq}/cpns", method = RequestMethod.GET)
//	public ModelAndView getCustCpnList(@PathVariable("custSeq") String custSeq, @ModelAttribute("custSearchVO") ComDefaultVO custSearchVO, ModelMap model) throws Exception {
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("jsonView");
//		
//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			//@Todo 에러처리
//			return modelAndView;
//		}
//		
//		CustCouponVO custCpnVO = new CustCouponVO();
//		custCpnVO.setCustSeq(custSeq);
//		custCpnVO.setCpnType(custSearchVO.getCpnType());
//		
//		List<CustCouponVO> custCpnList = custService.selectCustCouponList(custCpnVO);
//		int totalCnt = custCpnList.size();
//		
//		modelAndView.addObject("draw", custSearchVO.getDraw());
//		modelAndView.addObject("recordsTotal", totalCnt);
//		modelAndView.addObject("recordsFiltered", totalCnt);
//		modelAndView.addObject("custCpnList", custCpnList);
//		
//		return modelAndView;
//	}
	
	/**
	 * 입주사 쿠폰 정보 저장
	 * @return ModelAndView
	 * @exception Exception
	 */
//	@RequestMapping(value = "/cpns/custs/{custSeq}/cpns", method = RequestMethod.POST)
//	public ModelAndView insertCustCpn(@PathVariable("custSeq") String custSeq, @ModelAttribute("park") String parkCd, @RequestBody CustCouponVO[] custCpnList, ModelMap model) throws Exception {
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("jsonView");
//		
//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			return modelAndView;
//		}
//		
//		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
//		CustVO custVO = new CustVO();
//		custVO.setParkCd(parkCd);
//		custVO.setCustSeq(custSeq);
//		custVO.setRegId(loginVO.getId());
//		custVO.setUpdtId(loginVO.getId());
//		custVO.setCustCpnList(custCpnList);
//		
//		custService.insertCustCpn(custVO);
//		model.addAttribute("retMsg", "common.message.success");
//		
//		return modelAndView;
//	}
	
}
