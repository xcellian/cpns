package wpk.cpns.cpn.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import wpk.com.service.ComDefaultVO;
import wpk.cpns.cpn.service.CouponVO;
import wpk.cpns.cust.service.CustCouponVO;
import wpk.cpns.cust.service.CustVO;

import org.springframework.stereotype.Repository;

/**
 * 쿠폰관리에 관한 데이터 접근 클래스를 정의한다.
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
@Repository("cpnDAO")
public class CouponDAO extends EgovComAbstractDAO {
	
	/**
	 * 쿠폰 리스트 취득
	 * @param cpnSearchVO 검색조건
	 * @return List<CouponVO> 쿠폰 정보 리스트
	 */
	public List<CouponVO> selectCpnList(ComDefaultVO cpnSearchVO) {
		return selectList("cpnDAO.selectCpnList", cpnSearchVO);
	}
	
	/**
	 * 전체 쿠폰 수 취득
	 * @param cpnSearchVO 검색조건
	 * @return int 전체 쿠폰 수
	 */
	public int selectCpnListTotalCnt(ComDefaultVO cpnSearchVO) {
		return (Integer)selectOne("cpnDAO.selectCpnListTotalCnt", cpnSearchVO);
	}
	
	/**
	 * 주차장별 쿠폰 리스트 취득
	 * @param cpnSeq 검색조건
	 * @return List<CouponVO> 쿠폰 정보 리스트
	 */
	public List<CouponVO> selectCpnListByPark(ComDefaultVO cpnSearchVO) {
		return selectList("cpnDAO.selectCpnListByPark", cpnSearchVO);
	}
	
	/**
	 * 쿠폰 정보 취득
	 * @param cpnSeq 검색조건
	 * @return CouponVO 쿠폰 정보
	 */
	public CouponVO selectCpn(String cpnSeq) {
		return selectOne("cpnDAO.selectCpn", cpnSeq);
	}
	
	/**
	 * 쿠폰 정보 변경
	 * @param cpnVO 쿠폰 수정 정보
	 * @return int 변경 쿠폰 수
	 */
	public int updateCpn(CouponVO cpnVO) {
		return update("cpnDAO.updateCpn", cpnVO);
	}
	
	/**
	 * 쿠폰 코드 중복체크
	 * @param cpnVO 체크대상 쿠폰 정보
	 * @return int 중복 쿠폰 수
	 */
	public int checkCpnCdDuplicate(CouponVO cpnVO) {
		return (Integer)selectOne("cpnDAO.checkCpnCdDuplicate", cpnVO);
	}
	
	/**
	 * 쿠폰 정보 등록
	 * @param cpnVO 쿠폰 정보
	 * @return int 등록 쿠폰 수
	 */
	public int insertCpn(CouponVO cpnVO) {
		return insert("cpnDAO.insertCpn", cpnVO);
	}
	
	/**
	 * 입주사 쿠폰 리스트 취득
	 * @param custCpnVO 검색조건
	 * @return List<CustCouponVO> 입주사 쿠폰 리스트
	 */
	public List<CustCouponVO> selectCustCouponList(CustCouponVO custCpnVO){
		return selectList("cpnDAO.selectCustCouponList", custCpnVO);
	}
	
	/**
	 * 입주사 쿠폰 정보 등록
	 * @param custVO 입주사 정보
	 * @return int 등록 입주사 쿠폰 수
	 */
	public int insertCustCpn(CustCouponVO custCpnVO){
		return insert("cpnDAO.insertCustCpn", custCpnVO);
	}
	
	/**
	 * 입주사 쿠폰 정보 전체 삭제
	 * @param custVO 입주사 정보
	 * @return int 등록 입주사 쿠폰 삭제 수
	 */
	public int deleteAllCustCpn(CustVO custVO){
		return insert("cpnDAO.deleteAllCustCpn", custVO);
	}
	
	/**
	 * 입주사 쿠폰 정보 취득
	 * @param custCpnVO 검색조건
	 * @return CustCouponVO 입주사 쿠폰 정보
	 */
	public CustCouponVO selectCustCpn(CustCouponVO custCpnVO) {
		return selectOne("cpnDAO.selectCustCpn", custCpnVO);
	}
	
}