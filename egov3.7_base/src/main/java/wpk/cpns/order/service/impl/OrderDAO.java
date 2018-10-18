package wpk.cpns.order.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import wpk.com.service.ComDefaultVO;
import wpk.cpns.cpn.service.CouponVO;
import wpk.cpns.cust.service.CustCouponVO;
import wpk.cpns.cust.service.CustVO;
import wpk.cpns.order.service.OrderDetailVO;
import wpk.cpns.order.service.OrderVO;
import wpk.cpns.order.service.PayVO;

import org.springframework.stereotype.Repository;

/**
 * 일반회원관리에 관한 데이터 접근 클래스를 정의한다.
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
@Repository("orderDAO")
public class OrderDAO extends EgovComAbstractDAO{
	
	/**
	 * 입주사 주문 리스트 취득
	 * @param orderSearchVO 검색조건
	 * @return List<OrderVO> 입주사 주문 리스트
	 */
	public List<OrderVO> selectOrderList(ComDefaultVO orderSearchVO){
		return selectList("orderDAO.selectOrderList", orderSearchVO);
	}
	
	/**
	 * 입주사 전체 주문 수 취득
	 * @param orderSearchVO 검색조건
	 * @return int 입주사 전체 주문 수
	 */
	public int selectOrderListTotalCnt(ComDefaultVO orderSearchVO) {
		return (Integer)selectOne("orderDAO.selectOrderListTotalCnt", orderSearchVO);
	}
	
	/**
	 * 주문 정보 취득
	 * @param orderSeq 검색조건
	 * @return OrderVO 주문 정보
	 */
	public OrderVO selectOrder(String orderSeq){
		return selectOne("orderDAO.selectOrder", orderSeq);
	}
	
	/**
	 * 주문 정보 등록
	 * @param order 주문 정보
	 * @return int 등록 주문 수
	 */
	public int insertOrder(OrderVO orderVO){
		return insert("orderDAO.insertOrder", orderVO);
	}
	
	/**
	 * 주문상세 정보 등록
	 * @param order 주문 정보
	 * @return int 등록 주문 수
	 */
	public int insertOrderDetail(OrderVO orderVO){
		return insert("orderDAO.insertOrderDetail", orderVO);
	}
	
	/**
	 * 결제 정보 등록
	 * @param order 주문 정보
	 * @return int 등록 주문 수
	 */
	public int insertPayInfo(OrderVO orderVO){
		return insert("orderDAO.insertPayInfo", orderVO);
	}
	
	/**
	 * 화면에 조회된 일반회원의 정보를 데이터베이스에서 삭제
	 * @param delId 삭제 대상 일반회원아이디
	 */
//	public void deleteMber(String delId){
//		delete("mberManageDAO.deleteMber_S", delId);
//	}
	
	/**
	 * 일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param mberManageVO 일반회원 등록정보
	 * @return String 등록결과
	 */
//	public String insertMber(MberManageVO mberManageVO){
//		return String.valueOf((int)insert("mberManageDAO.insertMber_S", mberManageVO));
//	}
	
	/**
	 * 기 등록된 사용자 중 검색조건에 맞는일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param mberId 상세조회대상 일반회원아이디
	 * @return MberManageVO 일반회원 상세정보
	 */
//	public MberManageVO selectMber(String mberId){
//		return (MberManageVO) selectOne("mberManageDAO.selectMber_S", mberId);
//	}
	
	/**
	 * 화면에 조회된일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param mberManageVO 일반회원수정정보
	 */
//	public void updateMber(MberManageVO mberManageVO){
//		update("mberManageDAO.updateMber_S",mberManageVO);
//	}
	
	/**
	 * 일반회원 약관확인
	 * @param stplatId 일반회원약관아이디
	 * @return List 일반회원약관정보
	 */
//	public List<?> selectStplat(String stplatId){
//		return selectList("mberManageDAO.selectStplat_S", stplatId);
//	}
	
	/**
	 * 일반회원 암호수정
	 * @param passVO 기업회원수정정보(비밀번호)
	 */
//	public void updatePassword(MberManageVO passVO) {
//		update("mberManageDAO.updatePassword_S", passVO);
//	}
	
	/**
	 * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 * @param mberManageVO 일반회원암호 조회조건정보
	 * @return MberManageVO 일반회원 암호정보
	 */
//	public MberManageVO selectPassword(MberManageVO mberManageVO){
//		return (MberManageVO) selectOne("mberManageDAO.selectPassword_S", mberManageVO);
//	}
	
	/**
	 * 로그인인증제한 해제
	 * @param mberManageVO 일반회원정보
	 */
//	public void updateLockIncorrect(MberManageVO mberManageVO) {
//		update("mberManageDAO.updateLockIncorrect", mberManageVO);
//	}

}