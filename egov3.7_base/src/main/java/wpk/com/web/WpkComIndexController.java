package wpk.com.web;

/**
 * 컴포넌트 설치 후 설치된 컴포넌트들을 IncludedInfo annotation을 통해 찾아낸 후
 * 화면에 표시할 정보를 처리하는 Controller 클래스
 * <Notice>
 * 		개발시 메뉴 구조가 잡히기 전에 배포파일들에 포함된 공통 컴포넌트들의 목록성 화면에
 * 		URL을 제공하여 개발자가 편하게 활용하도록 하기 위해 작성된 것으로,
 * 		실제 운영되는 시스템에서는 적용해서는 안 됨
 *      실 운영 시에는 삭제해서 배포해도 좋음
 * <Disclaimer>
 * 		운영시에 본 컨트롤을 사용하여 메뉴를 구성하는 경우 성능 문제를 일으키거나
 * 		사용자별 메뉴 구성에 오류를 발생할 수 있음
 * @author 공통컴포넌트 정진오
 * @since 2011.08.26
 * @version 2.0.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일		수정자		수정내용
 *  -------    	--------    ---------------------------
 *  2011.08.26	정진오 		최초 생성
 *  2011.09.16  서준식		컨텐츠 페이지 생성
 *  2011.09.26  이기하		header, footer 페이지 생성
 * </pre>
 */

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import wpk.com.service.MenuVO;
import wpk.com.service.WpkComUtilService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WpkComIndexController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(WpkComIndexController.class);
	
	/** WpkComUtilService */
	@Resource(name = "wpkComUtilService")
	private WpkComUtilService wpkComUtilService;
	
	/* 입주사 */
	@RequestMapping("/index.do")
	public String index(ModelMap model) {
		model.addAttribute("userSe", "ENT");
		return "wpk/com/Main";
	}
	
	/* 관리자 */
	@RequestMapping("/mngt")
	public String mngtIndex(ModelMap model) {
		model.addAttribute("userSe", "USR");
		return "wpk/com/Main";
	}
	
	@RequestMapping("/top.do")
	public String top(HttpServletRequest request, ModelMap model) {
		
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
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if (loginVO == null) {
			model.addAttribute("userSe", StringUtils.isNotEmpty(request.getParameter("userSe"))? (String)request.getParameter("userSe"): "ENT");
		}
		else {
			model.addAttribute("loginVO", loginVO);
			model.addAttribute("userSe", loginVO.getUserSe());
		}
		
		return "wpk/com/Top";
	}
	
	@RequestMapping("/bottom.do")
	public String bottom() {
		return "wpk/com/Bottom";
	}
	
	@RequestMapping("/content.do")
	public String setContent(HttpServletRequest request, ModelMap model) throws Exception {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if (loginVO == null) {
			model.addAttribute("userSe", StringUtils.isNotEmpty(request.getParameter("userSe"))? (String)request.getParameter("userSe"): "ENT");
		}
		else {
			//메뉴취득
			List<String> authList = EgovUserDetailsHelper.getAuthorities();
			List<MenuVO> menuList = new ArrayList<MenuVO>();
			if (authList.contains("ROLE_ADMIN")) {
				menuList = wpkComUtilService.selectMenuList("ROLE_ADMIN");
			}
			else if (authList.contains("ROLE_USER")) {
				menuList = wpkComUtilService.selectMenuList("ROLE_USER");
			}
			
			model.addAttribute("loginVO", loginVO);
			model.addAttribute("menu", menuList);
			model.addAttribute("userSe", loginVO.getUserSe());
		}
		
		return "wpk/com/Content";
	}
}
