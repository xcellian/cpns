package egovframework.com.cmm.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class EgovLogoutSuccessHndlr extends SimpleUrlLogoutSuccessHandler {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovLogoutSuccessHndlr.class);
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		
		if(authentication != null) {
			System.out.println(authentication.getName());
		}
		//perform other required operation
		String URL = request.getContextPath() + "/content.do?userSe=USR";
		response.setStatus(HttpStatus.OK.value());
		response.sendRedirect(URL);
		
		String refererUrl = request.getHeader("Referer");
		LOGGER.debug("Logout from: " + refererUrl);
		setDefaultTargetUrl("/login");
		
		
		super.onLogoutSuccess(request, response, authentication);
	}
}
