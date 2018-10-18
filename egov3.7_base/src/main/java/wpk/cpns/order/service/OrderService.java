package wpk.cpns.order.service;

import java.util.List;
import java.util.Map;

import wpk.com.service.ComDefaultVO;
import wpk.cpns.cpn.service.CouponVO;
import wpk.cpns.cust.service.CustVO;

/**
 * 일반회원관리에 관한 인터페이스클래스를 정의한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *   2017.07.21  장동한 			로그인인증제한 작업
 *
 * </pre>
 */
public interface OrderService {
	
	/**
	 * 입주사 주문 리스트 취득
	 * @param orderSearchVO 검색조건
	 * @return List<OrderVO> 입주사 주문 리스트
	 * @throws Exception
	 */
	public List<OrderVO> selectOrderList(ComDefaultVO orderSearchVO) throws Exception;
	
	/**
	 * 입주사 전체 주문 수 취득
	 * @param orderSearchVO 검색조건
	 * @return int 입주사 전체 주문 수
	 * @throws Exception
	 */
	public int selectOrderListTotalCnt(ComDefaultVO orderSearchVO) throws Exception;
	
	/**
	 * 주문 정보 취득
	 * @param orderSeq 검색조건
	 * @return OrderVO 입주사 정보
	 * @throws Exception
	 */
	public OrderVO selectOrder(String orderSeq) throws Exception;
	
	/**
	 * 주문 정보 등록
	 * @param order 주문 정보
	 * @return int 등록 주문 수
	 * @throws Exception
	 */
	public int insertOrder(OrderVO orderVO) throws Exception;
	
}