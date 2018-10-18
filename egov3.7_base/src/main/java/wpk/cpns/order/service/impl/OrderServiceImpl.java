package wpk.cpns.order.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.utl.sim.service.EgovFileScrty;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import wpk.cpns.cust.service.CustVO;
import wpk.cpns.order.service.OrderService;
import wpk.cpns.order.service.OrderVO;
import wpk.com.service.ComDefaultVO;
import wpk.com.service.ParkMasterVO;
import wpk.com.service.WpkComUtilService;
import wpk.cpns.cpn.service.CouponVO;
import wpk.cpns.cust.service.CustCouponVO;
import wpk.cpns.cust.service.CustService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 일반회원관리에 관한비지니스클래스를 정의한다.
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
 *   2014.12.08	 이기하			암호화방식 변경(EgovFileScrty.encryptPassword)
 *   2017.07.21  장동한 			로그인인증제한 작업
 *
 * </pre>
 */
@Service("orderService")
public class OrderServiceImpl extends EgovAbstractServiceImpl implements OrderService {
	
	/** orderDAO */
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;
	
	/** custSeqGnrService */
//	@Resource(name="custSeqGnrService")
//	private EgovIdGnrService idgenService;
	
	/** WpkComUtilService */
	@Resource(name = "wpkComUtilService")
	private WpkComUtilService wpkComUtilService;
	
	/** EgovPropertyService */
	@Resource(name = "wpkPropertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * 입주사 주문 리스트 취득
	 * @param orderSearchVO 검색조건
	 * @return List<OrderVO> 입주사 주문 리스트
	 */
	@Override
	public List<OrderVO> selectOrderList(ComDefaultVO orderSearchVO) {
		return orderDAO.selectOrderList(orderSearchVO);
	}
	
	/**
	 * 입주사 전체 주문 수 취득
	 * @param orderSearchVO 검색조건
	 * @return int 입주사 전체 주문 수
	 */
	@Override
	public int selectOrderListTotalCnt(ComDefaultVO orderSearchVO) {
		return orderDAO.selectOrderListTotalCnt(orderSearchVO);
	}
	
	/**
	 * 주문 정보 취득
	 * @param orderSeq 검색조건
	 * @return OrderVO 입주사 정보
	 */
	@Override
	public OrderVO selectOrder(String orderSeq) {
		return orderDAO.selectOrder(orderSeq);
	}
	
	/**
	 * 주문 정보 등록
	 * @param order 주문 정보
	 * @return int 등록 주문 수
	 * @throws Exception
	 */
	@Override
	public int insertOrder(OrderVO orderVO) throws Exception {
		
		int ret = 0;
		//주문정보 등록
		ret = orderDAO.insertOrder(orderVO);
		
		//주문상세 정보 등록
		//orderDAO.insertOrderDetail(orderVO.getOrderDetail());
		orderDAO.insertOrderDetail(orderVO);
		
		//결제정보 등록
		orderDAO.insertPayInfo(orderVO);
		
		return ret;
	}
	
}