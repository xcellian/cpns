package wpk.cpns.cpn.service;

import java.util.List;

import wpk.com.service.ComDefaultVO;
import wpk.cpns.cust.service.CustCouponVO;
import wpk.cpns.cust.service.CustVO;

/**
 * 쿠폰관리에 관한 인터페이스클래스를 정의한다.
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
public interface CouponService {
	
	/**
	 * 쿠폰 리스트 취득
	 * @param cpnSearchVO 검색조건
	 * @return List<CouponVO> 쿠폰 정보 리스트
	 * @throws Exception
	 */
	public List<CouponVO> selectCpnList(ComDefaultVO cpnSearchVO) throws Exception;
	
	/**
	 * 전체 쿠폰 수 취득
	 * @param cpnSearchVO 검색조건
	 * @return int 전체 쿠폰 수
	 * @throws Exception
	 */
	public int selectCpnListTotalCnt(ComDefaultVO cpnSearchVO) throws Exception;
	
	/**
	 * 주차장별 쿠폰 리스트 취득
	 * @param cpnSeq 검색조건
	 * @return List<CouponVO> 쿠폰 정보 리스트
	 * @throws Exception
	 */
	public List<CouponVO> selectCpnListByPark(ComDefaultVO cpnSearchVO) throws Exception;
	
	/**
	 * 쿠폰 정보 취득
	 * @param cpnSeq 검색조건
	 * @return CouponVO 쿠폰 정보
	 * @throws Exception
	 */
	public CouponVO selectCpn(String cpnSeq) throws Exception;
	
	/**
	 * 쿠폰 정보 변경
	 * @param cpnVO 쿠폰 수정 정보
	 * @return int 변경 쿠폰 수
	 * @throws Exception
	 */
	public int updateCpn(CouponVO cpnVO) throws Exception;
	
	/**
	 * 쿠폰 코드 중복체크
	 * @param cpnVO 체크대상 쿠폰 정보
	 * @return int 중복 쿠폰 수
	 * @throws Exception
	 */
	public int checkCpnCdDuplicate(CouponVO cpnVO) throws Exception;
	
	/**
	 * 쿠폰 정보 등록
	 * @param cpnVO
	 * @return int 등록 쿠폰 수
	 * @throws Exception
	 */
	public int insertCpn(CouponVO cpnVO) throws Exception;
	
	/**
	 * 입주사 쿠폰 리스트 취득
	 * @param custCpnVO 검색조건
	 * @return List<CustCouponVO> 입주사 쿠폰 리스트
	 * @throws Exception
	 */
	public List<CustCouponVO> selectCustCouponList(CustCouponVO custCpnVO) throws Exception;
	
	/**
	 * 입주사 쿠폰 정보 등록
	 * @param custVO 입주사 정보
	 * @return int 등록 입주사 쿠폰 수
	 * @throws Exception
	 */
	public int insertCustCpn(CustVO custVO) throws Exception;
	
	/**
	 * 입주사 쿠폰 정보 전체 삭제
	 * @param custVO 입주사 정보
	 * @return int 삭제 입주사 쿠폰 수
	 * @throws Exception
	 */
	public int deleteAllCustCpn(CustVO custVO) throws Exception;
	
	/**
	 * 입주사 쿠폰 정보 취득
	 * @param custCpnVO 검색조건
	 * @return CustCouponVO 입주사 쿠폰 정보
	 */
	public CustCouponVO selectCustCpn(CustCouponVO custCpnVO) throws Exception;

}